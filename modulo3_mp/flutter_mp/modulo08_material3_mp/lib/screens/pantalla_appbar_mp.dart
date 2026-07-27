// lib/screens/pantalla_appbar_mp.dart
import 'package:flutter/material.dart';

class PantallaAppBar extends StatelessWidget {
  const PantallaAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar.large(
            title:           const Text('Inventario de Motos'),
            pinned:          true,
            backgroundColor: cs.primaryContainer,
            foregroundColor: cs.onPrimaryContainer,
            actions: [
              IconButton(icon: const Icon(Icons.filter_list), onPressed: () {}, tooltip: 'Filtrar'),
              IconButton(icon: const Icon(Icons.search), onPressed: () {}, tooltip: 'Buscar'),
            ],
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                color: cs.primaryContainer,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 56),
                    Icon(Icons.two_wheeler, size: 48, color: cs.onPrimaryContainer),
                    const SizedBox(height: 8),
                    Text('24 motos en inventario',
                        style: TextStyle(color: cs.onPrimaryContainer)),
                  ],
                ),
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(8),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, i) => Card(
                  child: ListTile(
                    leading:  Icon(Icons.two_wheeler, color: cs.primary),
                    title:    Text('Moto ${i + 1} — Honda CBR 500R'),
                    subtitle: Text('Disponible · Stock: ${3 - (i % 3)}'),
                    trailing: Chip(
                      label:           Text(i % 3 == 0 ? 'Reservada' : 'OK'),
                      backgroundColor: i % 3 == 0 ? cs.tertiaryContainer : cs.primaryContainer,
                      labelStyle: TextStyle(
                          color: i % 3 == 0 ? cs.onTertiaryContainer : cs.onPrimaryContainer),
                    ),
                    onTap: () {},
                  ),
                ),
                childCount: 10,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
