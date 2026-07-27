// lib/widgets/catalogo_botones_mp.dart
import 'package:flutter/material.dart';

class CatalogoBotones extends StatelessWidget {
  const CatalogoBotones({super.key});

  @override
  Widget build(BuildContext context) {
    final cs   = Theme.of(context).colorScheme;
    final text = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title:           const Text('Botones Material 3'),
        backgroundColor: cs.surfaceContainerHighest,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Text('Variantes — de mayor a menor énfasis',
              style: text.labelLarge?.copyWith(color: cs.primary)),
          const SizedBox(height: 12),
          FilledButton(onPressed: () {}, child: const Text('FilledButton — vender moto')),
          const SizedBox(height: 8),
          FilledButton.tonal(onPressed: () {}, child: const Text('FilledButton.tonal — guardar borrador')),
          const SizedBox(height: 8),
          ElevatedButton(onPressed: () {}, child: const Text('ElevatedButton — procesar venta')),
          const SizedBox(height: 8),
          OutlinedButton(onPressed: () {}, child: const Text('OutlinedButton — ver inventario')),
          const SizedBox(height: 8),
          TextButton(onPressed: () {}, child: const Text('TextButton — cancelar')),
          const Divider(height: 32),
          Text('Con ícono', style: text.labelLarge?.copyWith(color: cs.primary)),
          const SizedBox(height: 12),
          FilledButton.icon(onPressed: () {}, icon: const Icon(Icons.send), label: const Text('Enviar cotización')),
          const SizedBox(height: 8),
          OutlinedButton.icon(onPressed: () {}, icon: const Icon(Icons.download), label: const Text('Exportar inventario')),
          const SizedBox(height: 8),
          TextButton.icon(onPressed: () {}, icon: const Icon(Icons.open_in_new), label: const Text('Ver catálogo')),
          const Divider(height: 32),
          Text('Estados y personalización', style: text.labelLarge?.copyWith(color: cs.primary)),
          const SizedBox(height: 12),
          FilledButton(onPressed: null, child: const Text('No disponible')),
          const SizedBox(height: 8),
          FilledButton(
            style: FilledButton.styleFrom(backgroundColor: cs.error, foregroundColor: cs.onError, minimumSize: const Size(double.infinity, 48)),
            onPressed: () {},
            child: const Text('Eliminar del inventario'),
          ),
          const SizedBox(height: 8),
          Row(children: [
            Expanded(child: OutlinedButton(onPressed: () {}, child: const Text('Rechazar'))),
            const SizedBox(width: 8),
            Expanded(child: FilledButton(onPressed: () {}, child: const Text('Confirmar'))),
          ]),
        ],
      ),
    );
  }
}
