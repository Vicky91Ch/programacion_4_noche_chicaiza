import 'dart:async';
import 'package:flutter/material.dart';

class Reloj extends StatefulWidget {
  const Reloj({super.key});

  @override
  State<Reloj> createState() => _RelojState();
}

class _RelojState extends State<Reloj> {
  late Timer _timer;      // late — se asigna en initState, antes no existe
  int  _segundos = 0;
  bool _pausado  = false;
  int _vueltas = 0;


  @override
  void initState() {
    super.initState();    // ← siempre primero
    _iniciarTimer();
  }

  void _iniciarTimer() {
    _timer = Timer.periodic(const Duration(milliseconds: 10), (_) {
      if (!mounted) return;   // ← protege setState en callbacks
      setState(() => _segundos++);
    });
  }

  void _togglePausa() {
    setState(() {
      _pausado = !_pausado;
      if (_pausado) {
        _timer.cancel();      // pausa: cancela el timer actual
      } else {
        _iniciarTimer();      // reanuda: crea un timer nuevo
      }
    });
  }


  void _registrarVuelta() {
    setState(() {
        _vueltas = _vueltas++;
    });
  }

  @override
  void dispose() {
    //_timer.cancel();          // ← SIEMPRE liberar en dispose
    super.dispose();          // ← siempre al final
  }

  String get _formato {
    final h = _segundos ~/ 3600;
    final m = (_segundos % 3600) ~/ 60;
    final s = _segundos % 60;
    return '$h:${m.toString().padLeft(2, '0')}:${s.toString().padLeft(2, '0')}';
  }

  // Color cambia según el tiempo transcurrido
  Color get _colorTiempo {
    if (_segundos > 60) return const Color.fromARGB(255, 158, 54, 244);
    if (_segundos > 30) return const Color.fromRGBO(255, 0, 242, 1);
    if (_segundos > 120) return const Color.fromARGB(255, 0, 38, 255);
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
            fontSize:   40,
            fontFamily: 'monospace',
            fontWeight: FontWeight.bold,
            color:      _colorTiempo,         // cambia automáticamente con el tiempo
          ),
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            FilledButton.icon(
              onPressed: _togglePausa,
              icon:  Icon(_pausado ? Icons.play_arrow : Icons.pause),
              label: Text(_pausado ? 'Reanudar' : 'Pausar'),
            ),
            const SizedBox(width: 8),
            TextButton(
              onPressed: () => setState(() {
                _timer.cancel();
                _segundos = 0;
                _pausado  = false;
                _iniciarTimer();
              }),
              child: const Text('Reiniciar'),
            ),

          ],
        ),
        const SizedBox(height: 8),
        Text(
          _pausado ? 'Pausado' : 'Corriendo',
          style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
        ),

        const SizedBox(height: 8),
        TextButton(
          onPressed : () => setState (() {
            _vueltas+=3;
          }),
          child: const Text('Registrar Vueltas con SetState')
        ),

        const SizedBox(height: 8),
        TextButton(
          onPressed : _registrarVuelta,
          child: const Text('Registrar Vueltas con Funcion')
        ),
        Text(
          'Vueltas: $_vueltas',
          style: TextStyle(fontSize: 20, color: Colors.blueAccent.shade700),
        ),
      ],
    );
  }
}