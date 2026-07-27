// lib/screens/pantalla_detalle_mp.dart
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../models/moto_venta_mp.dart';

class PantallaDetalle extends StatelessWidget {
  final String      id;
  final MotoVenta?  moto;

  const PantallaDetalle({super.key, required this.id, this.moto});

  @override
  Widget build(BuildContext context) {
    final m = moto ?? motosSimuladas.where((m) => m.id == id).firstOrNull;
    final cs = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: Text('Detalle: ${m?.marca ?? id} ${m?.modelo ?? ""}'),
        backgroundColor: cs.primaryContainer,
        foregroundColor: cs.onPrimaryContainer,
      ),
      body: m == null
          ? Center(child: Text('Moto $id no encontrada'))
          : Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _Fila('ID',       m.id),
                  _Fila('Marca',    m.marca),
                  _Fila('Modelo',   m.modelo),
                  _Fila('Motor',    m.cilindrada),
                  _Fila('Precio',   '\$${m.precio.toStringAsFixed(0)}'),
                  _Fila('Color',    m.colorMoto),
                  const SizedBox(height: 24),
                  Row(children: [
                    OutlinedButton.icon(
                      onPressed: () => context.pop(),
                      icon: const Icon(Icons.arrow_back),
                      label: const Text('Volver'),
                    ),
                    const SizedBox(width: 12),
                    FilledButton.icon(
                      onPressed: () => context.push('/ventas/${m.id}/historial'),
                      icon: const Icon(Icons.list_alt),
                      label: const Text('Ver historial'),
                    ),
                  ]),
                ],
              ),
            ),
    );
  }
}

class _Fila extends StatelessWidget {
  final String label;
  final String valor;
  const _Fila(this.label, this.valor);

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(children: [
        SizedBox(
          width: 70,
          child: Text(label,
              style: TextStyle(color: cs.onSurfaceVariant, fontWeight: FontWeight.w600, fontSize: 12)),
        ),
        Text(valor, style: const TextStyle(fontSize: 15)),
      ]),
    );
  }
}
