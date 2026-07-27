import 'dart:async';
import 'package:flutter/material.dart';

class Reloj extends StatefulWidget {
  const Reloj({super.key});

  @override
  State<Reloj> createState() => _RelojState();
}

class _RelojState extends State<Reloj> {
  late Timer _timer;
  int _segundos = 0;
  bool _pausado = false;
  int _ventasRealizadas = 0;

  @override
  void initState() {
    super.initState();
    _iniciarTimer();
  }

  void _iniciarTimer() {
    _timer = Timer.periodic(const Duration(milliseconds: 10), (_) {
      if (!mounted) return;
      setState(() => _segundos++);
    });
  }

  void _togglePausa() {
    setState(() {
      _pausado = !_pausado;
      if (_pausado) {
        _timer.cancel();
      } else {
        _iniciarTimer();
      }
    });
  }

  void _registrarVenta() {
    setState(() {
      _ventasRealizadas++;
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  String get _formato {
    final h = _segundos ~/ 3600;
    final m = (_segundos % 3600) ~/ 60;
    final s = _segundos % 60;
    return '$h:${m.toString().padLeft(2, '0')}:${s.toString().padLeft(2, '0')}';
  }

  Color get _colorTiempo {
    if (_segundos > 120) return const Color.fromARGB(255, 0, 38, 255);
    if (_segundos > 60) return const Color.fromARGB(255, 158, 54, 244);
    if (_segundos > 30) return const Color.fromRGBO(255, 0, 242, 1);
    return Colors.green;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          _formato,
          style: TextStyle(
            fontSize: 40,
            fontFamily: 'monospace',
            fontWeight: FontWeight.bold,
            color: _colorTiempo,
          ),
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            FilledButton.icon(
              onPressed: _togglePausa,
              icon: Icon(_pausado ? Icons.play_arrow : Icons.pause),
              label: Text(_pausado ? 'Reanudar' : 'Pausar'),
            ),
            const SizedBox(width: 8),
            TextButton(
              onPressed: () => setState(() {
                _timer.cancel();
                _segundos = 0;
                _pausado = false;
                _iniciarTimer();
              }),
              child: const Text('Reiniciar'),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Text(
          _pausado ? 'En pausa' : 'Cronómetro activo',
          style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
        ),
        const SizedBox(height: 8),
        TextButton(
          onPressed: () => setState(() {
            _ventasRealizadas += 3;
          }),
          child: const Text('Registrar venta con SetState'),
        ),
        const SizedBox(height: 8),
        TextButton(
          onPressed: _registrarVenta,
          child: const Text('Registrar venta con Función'),
        ),
        Text(
          'Ventas realizadas: $_ventasRealizadas',
          style: TextStyle(fontSize: 20, color: Colors.blueAccent.shade700),
        ),
      ],
    );
  }
}
