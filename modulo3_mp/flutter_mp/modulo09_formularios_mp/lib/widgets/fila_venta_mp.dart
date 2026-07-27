// lib/widgets/fila_venta_mp.dart
import 'package:flutter/material.dart';
import '../models/moto_venta_mp.dart';

class FilaVenta extends StatelessWidget {
  final MotoVenta venta;
  final VoidCallback onOferta;
  final VoidCallback onEliminar;

  const FilaVenta({
    super.key,
    required this.venta,
    required this.onOferta,
    required this.onEliminar,
  });

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: venta.vendida ? Colors.green.shade50 : cs.surfaceContainerHighest,
        child: Icon(
          Icons.two_wheeler,
          color: venta.vendida ? Colors.green : cs.onSurfaceVariant,
        ),
      ),
      title: Text('${venta.marca} ${venta.modelo}', style: const TextStyle(fontWeight: FontWeight.w600)),
      subtitle: Text(
        '${venta.cilindrada}cc · \$${venta.precio.toStringAsFixed(0)} · ${venta.colorMoto}',
        style: TextStyle(fontSize: 12, color: cs.onSurfaceVariant),
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            icon: Icon(
              venta.enOferta ? Icons.local_offer : Icons.local_offer_outlined,
              color: venta.enOferta ? Colors.orange : cs.outline,
            ),
            onPressed: onOferta,
            visualDensity: VisualDensity.compact,
            tooltip: venta.enOferta ? 'Quitar oferta' : 'Marcar en oferta',
          ),
          IconButton(
            icon: Icon(Icons.delete_outline, color: cs.error),
            onPressed: onEliminar,
            visualDensity: VisualDensity.compact,
            tooltip: 'Eliminar',
          ),
        ],
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
    );
  }
}
