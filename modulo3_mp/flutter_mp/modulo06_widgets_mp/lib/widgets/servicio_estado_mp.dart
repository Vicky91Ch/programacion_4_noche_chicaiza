import 'package:flutter/material.dart';

class ProcesoVenta extends StatefulWidget {
  final String nombre;
  const ProcesoVenta({super.key, required this.nombre});

  @override
  State<ProcesoVenta> createState() => _ProcesoVentaState();
}

class _ProcesoVentaState extends State<ProcesoVenta> {
  bool _activo = true;
  int _reintentos = 0;

  static const int _maxReintentos = 3;

  void _toggle() {
    setState(() {
      _activo = !_activo;
      if (_activo) _reintentos++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final enLimite = _reintentos >= _maxReintentos;

    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            _activo ? Icons.check_circle : Icons.cancel,
            size: 72,
            color: _activo ? Colors.green : Colors.red,
          ),
          const SizedBox(height: 8),
          Text(widget.nombre,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
          Text(
            _activo ? 'Venta en proceso' : 'Venta detenida',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w600,
              color: _activo ? Colors.green.shade700 : Colors.red.shade700,
            ),
          ),
          const SizedBox(height: 16),
          if (!_activo)
            Container(
              margin: const EdgeInsets.only(bottom: 16),
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
              decoration: BoxDecoration(
                color: Colors.red.shade50,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.red.shade300),
              ),
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.warning_amber, color: Colors.red, size: 16),
                  SizedBox(width: 6),
                  Text('Requiere revisión del vendedor',
                      style: TextStyle(color: Colors.red, fontSize: 13)),
                ],
              ),
            ),
          FilledButton.icon(
            onPressed: enLimite ? null : _toggle,
            icon: Icon(_activo ? Icons.stop : Icons.play_arrow),
            label: Text(_activo ? 'Detener venta' : 'Iniciar venta'),
            style: FilledButton.styleFrom(
              backgroundColor: _activo ? Colors.red.shade600 : Colors.green.shade600,
            ),
          ),
          const SizedBox(height: 12),
          Opacity(
            opacity: enLimite ? 0.4 : 1.0,
            child: Text(
              'Reintentos: $_reintentos / $_maxReintentos',
              style: TextStyle(
                fontSize: 13,
                color: enLimite ? Colors.red : Colors.grey.shade600,
              ),
            ),
          ),
          if (enLimite)
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Text(
                'Límite de reintentos alcanzado',
                style: TextStyle(
                    fontSize: 12, color: Colors.red.shade700, fontWeight: FontWeight.bold),
              ),
            ),
        ],
      ),
    );
  }
}
