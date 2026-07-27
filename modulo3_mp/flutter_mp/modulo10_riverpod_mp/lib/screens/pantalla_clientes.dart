// lib/screens/pantalla_clientes.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/clientes_provider.dart';

class PantallaClientes extends ConsumerWidget {
  const PantallaClientes({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final clientes = ref.watch(clientesProvider);
    final cs       = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: Text('Clientes (${clientes.length})'),
        backgroundColor: cs.primaryContainer,
        foregroundColor: cs.onPrimaryContainer,
      ),
      body: clientes.isEmpty
          ? const Center(child: Text('Sin clientes'))
          : ListView.separated(
              itemCount: clientes.length,
              separatorBuilder: (_, __) => const Divider(height: 1, indent: 72),
              itemBuilder: (context, i) {
                final c = clientes[i];
                return ListTile(
                  leading: CircleAvatar(
                    backgroundColor: cs.primaryContainer,
                    child: Icon(Icons.person, color: cs.onPrimaryContainer),
                  ),
                  title: Text(c.nombre, style: const TextStyle(fontWeight: FontWeight.w600)),
                  subtitle: Text('${c.cedula} · ${c.telefono}'),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: Icon(
                          c.favorito ? Icons.star : Icons.star_border,
                          color: c.favorito ? Colors.amber : null,
                        ),
                        onPressed: () => ref.read(clientesProvider.notifier).toggleFavorito(c.id),
                      ),
                      IconButton(
                        icon: const Icon(Icons.delete_outline, color: Colors.red),
                        onPressed: () => ref.read(clientesProvider.notifier).eliminar(c.id),
                      ),
                    ],
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final id = DateTime.now().millisecondsSinceEpoch.toString();
          ref.read(clientesProvider.notifier).agregar(
            Cliente(id: id, nombre: 'Cliente-$id', cedula: '0000000000', telefono: '0990000000', email: 'nuevo@email.com'),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
