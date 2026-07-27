// lib/screens/pantalla_busqueda_mp.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/ventas_provider_mp.dart';

class PantallaBusqueda extends ConsumerWidget {
  const PantallaBusqueda({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final motos    = ref.watch(motosFiltradasProvider);
    final busqueda = ref.watch(busquedaProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Buscar motos')),
      body: Column(children: [
        Padding(
          padding: const EdgeInsets.all(12),
          child: SearchBar(
            hintText: 'Buscar por marca o modelo...',
            leading: const Icon(Icons.search),
            trailing: busqueda.isNotEmpty
                ? [IconButton(
                    icon: const Icon(Icons.clear),
                    onPressed: () => ref.read(busquedaProvider.notifier).state = '',
                  )]
                : null,
            onChanged: (v) => ref.read(busquedaProvider.notifier).state = v,
            padding: const WidgetStatePropertyAll(EdgeInsets.symmetric(horizontal: 16)),
          ),
        ),
        Expanded(
          child: motos.isEmpty
              ? const Center(child: Text('Sin resultados'))
              : ListView.builder(
                  itemCount: motos.length,
                  itemBuilder: (_, i) => ListTile(
                    leading: const Icon(Icons.two_wheeler),
                    title: Text('${motos[i].marca} ${motos[i].modelo}'),
                    subtitle: Text(motos[i].cilindrada),
                  ),
                ),
        ),
      ]),
    );
  }
}
