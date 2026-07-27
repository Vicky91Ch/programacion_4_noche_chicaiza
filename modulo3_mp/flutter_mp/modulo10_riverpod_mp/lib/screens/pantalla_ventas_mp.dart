// lib/screens/pantalla_ventas_mp.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:modulo10_riverpod_mp/models/moto_venta_mp.dart';
import '../providers/ventas_provider_mp.dart';

class PantallaVentas extends ConsumerWidget {
  const PantallaVentas({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final motos = ref.watch(ventasProvider);
    final cs    = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: Text('Inventario (${motos.length})'),
        backgroundColor: cs.primaryContainer,
        foregroundColor: cs.onPrimaryContainer,
      ),
      body: motos.isEmpty
          ? const Center(child: Text('Sin motos en inventario'))
          : ListView.separated(
              itemCount: motos.length,
              separatorBuilder: (_, __) => const Divider(height: 1, indent: 72),
              itemBuilder: (context, i) {
                final m = motos[i];
                return ListTile(
                  leading: CircleAvatar(
                    backgroundColor: m.vendida ? Colors.green.shade50 : Colors.grey.shade100,
                    child: Icon(Icons.two_wheeler,
                        color: m.vendida ? Colors.green : Colors.grey),
                  ),
                  title: Text('${m.marca} ${m.modelo}',
                      style: const TextStyle(fontWeight: FontWeight.w600)),
                  subtitle: Text('${m.cilindrada} · ${m.vendida ? "Vendida" : "Disponible"}'),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: Icon(
                          m.enOferta ? Icons.local_offer : Icons.local_offer_outlined,
                          color: m.enOferta ? Colors.orange : null,
                        ),
                        onPressed: () => ref.read(ventasProvider.notifier).toggleOferta(m.id),
                      ),
                      IconButton(
                        icon: const Icon(Icons.delete_outline, color: Colors.red),
                        onPressed: () => ref.read(ventasProvider.notifier).eliminar(m.id),
                      ),
                    ],
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final id = DateTime.now().millisecondsSinceEpoch.toString();
          ref.read(ventasProvider.notifier).agregar(
            MotoVenta(
              id: id, marca: 'Nueva', modelo: 'Moto-$id',
              cilindrada: '150cc', vendida: false,
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
