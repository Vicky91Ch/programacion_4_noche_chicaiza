// lib/widgets/fila_cliente.dart
import 'package:flutter/material.dart';
import '../models/cliente.dart';

class FilaCliente extends StatelessWidget {
  final Cliente cliente;
  final VoidCallback onFavorito;
  final VoidCallback onEliminar;

  const FilaCliente({
    super.key,
    required this.cliente,
    required this.onFavorito,
    required this.onEliminar,
  });

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: cs.primaryContainer,
        child: Icon(Icons.person, color: cs.onPrimaryContainer),
      ),
      title: Text(cliente.nombre, style: const TextStyle(fontWeight: FontWeight.w600)),
      subtitle: Text(
        '${cliente.cedula} · ${cliente.telefono}',
        style: TextStyle(fontSize: 12, color: cs.onSurfaceVariant),
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            icon: Icon(
              cliente.favorito ? Icons.star : Icons.star_border,
              color: cliente.favorito ? Colors.amber : cs.outline,
            ),
            onPressed: onFavorito,
            visualDensity: VisualDensity.compact,
            tooltip: cliente.favorito ? 'Quitar favorito' : 'Marcar favorito',
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
