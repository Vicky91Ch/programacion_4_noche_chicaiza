// lib/main.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:modulo10_riverpod_mp/screens/pantalla_busqueda_mp.dart';
import 'package:modulo10_riverpod_mp/screens/pantalla_ventas_mp.dart';

const int paso = 3;

final contadorProvider = StateProvider<int>((ref) => 0);

void main() {
  runApp(const ProviderScope(child: AppConcesionario()));
}

class AppConcesionario extends StatelessWidget {
  const AppConcesionario({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF0D47A1)),
        useMaterial3: true,
      ),
      home: switch (paso) {
        1 => const _Paso1(),
        2 => const PantallaVentas(),
        3 => const PantallaBusqueda(),
        _ => Scaffold(body: Center(child: Text('Paso $paso: crea el widget primero'))),
      },
    );
  }
}

class _Paso1 extends ConsumerWidget {
  const _Paso1();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final count = ref.watch(contadorProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('Motos registradas')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('$count', style: Theme.of(context).textTheme.displayLarge),
            const Text('motos en inventario'),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(
            heroTag: 'add',
            onPressed: () => ref.read(contadorProvider.notifier).state++,
            child: const Icon(Icons.add),
          ),
          const SizedBox(height: 8),
          FloatingActionButton(
            heroTag: 'rem',
            onPressed: () {
              if (ref.read(contadorProvider) > 0) {
                ref.read(contadorProvider.notifier).state--;
              }
            },
            child: const Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}
