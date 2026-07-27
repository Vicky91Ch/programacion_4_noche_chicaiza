// lib/widgets/tarjeta_cliente_grid.dart
import 'package:flutter/material.dart';
import '../models/cliente.dart';

class TarjetaClienteGrid extends StatelessWidget {
  final Cliente cliente;
  final VoidCallback onFavorito;
  final VoidCallback onEliminar;

  const TarjetaClienteGrid({
    super.key,
    required this.cliente,
    required this.onFavorito,
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
              Icon(Icons.person, color: cs.primary, size: 18),
              const Spacer(),
              GestureDetector(
                onTap: onFavorito,
                child: Icon(
                  cliente.favorito ? Icons.star : Icons.star_border,
                  color: cliente.favorito ? Colors.amber : cs.outline,
                  size: 18,
                ),
              ),
            ]),
            const SizedBox(height: 6),
            Text(
              cliente.nombre,
              style: text.titleSmall?.copyWith(fontWeight: FontWeight.bold),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              cliente.cedula,
              style: text.bodySmall?.copyWith(color: cs.onSurfaceVariant),
            ),
            const Spacer(),
            Row(children: [
              Icon(Icons.phone, size: 12, color: cs.onSurfaceVariant),
              const SizedBox(width: 4),
              Expanded(
                child: Text(
                  cliente.telefono,
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
}
