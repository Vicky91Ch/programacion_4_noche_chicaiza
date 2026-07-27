// lib/widgets/tarjeta_moto_grid_mp.dart
import 'package:flutter/material.dart';
import '../models/moto_venta_mp.dart';

class TarjetaMotoGrid extends StatelessWidget {
  final MotoVenta moto;
  final VoidCallback onOferta;
  final VoidCallback onEliminar;

  const TarjetaMotoGrid({
    super.key,
    required this.moto,
    required this.onOferta,
    required this.onEliminar,
  });

  @override
  Widget build(BuildContext context) {
    final cs   = Theme.of(context).colorScheme;
    final text = Theme.of(context).textTheme;

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(children: [
              Icon(Icons.two_wheeler, color: moto.vendida ? Colors.green : cs.outline, size: 18),
              const Spacer(),
              GestureDetector(
                onTap: onOferta,
                child: Icon(
                  moto.enOferta ? Icons.local_offer : Icons.local_offer_outlined,
                  color: moto.enOferta ? Colors.orange : cs.outline,
                  size: 18,
                ),
              ),
            ]),
            const SizedBox(height: 6),
            Text(
              '${moto.marca} ${moto.modelo}',
              style: text.titleSmall?.copyWith(fontWeight: FontWeight.bold),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              '${moto.cilindrada}cc · \$${moto.precio.toStringAsFixed(0)}',
              style: text.bodySmall?.copyWith(color: cs.onSurfaceVariant),
            ),
            const Spacer(),
            Row(children: [
              Container(
                width: 10, height: 10,
                decoration: BoxDecoration(color: _colorMoto(moto.colorMoto), shape: BoxShape.circle),
              ),
              const SizedBox(width: 4),
              Expanded(
                child: Text(
                  moto.colorMoto,
                  style: text.labelSmall?.copyWith(color: cs.onSurfaceVariant),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              GestureDetector(
                onTap: onEliminar,
                child: Icon(Icons.delete_outline, size: 16, color: cs.error),
              ),
            ]),
          ],
        ),
      ),
    );
  }

  Color _colorMoto(String color) {
    switch (color) {
      case 'Rojo':  return Colors.red;
      case 'Azul':  return Colors.blue;
      case 'Negro': return Colors.black87;
      case 'Blanco':return Colors.grey.shade300;
      case 'Verde': return Colors.green;
      case 'Gris':  return Colors.grey;
      default:      return Colors.grey;
    }
  }
}
