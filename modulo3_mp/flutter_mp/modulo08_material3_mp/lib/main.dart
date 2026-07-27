// lib/main.dart
import 'package:flutter/material.dart';
import 'package:modulo08_material3_mp/screens/pantalla_appbar_mp.dart';
import 'package:modulo08_material3_mp/screens/pantalla_tema_mp.dart';
import 'package:modulo08_material3_mp/widgets/catalogo_botones_mp.dart';
import 'package:modulo08_material3_mp/screens/pantalla_navegacion_mp.dart';
import 'package:modulo08_material3_mp/screens/pantalla_dialogs_mp.dart';

// ┌──────────────────────────────────────────────────────────────────┐
// │  Cambia este número y guarda (Ctrl+S) para navegar entre pasos. │
// │  1  Paso 1  ThemeData + Scaffold básico                         │
// │  2  Paso 2  Modo oscuro — ThemeMode dinámico                    │
// │  3  Paso 3  AppBar variantes y SliverAppBar                     │
// │  4  Paso 4  Botones Material 3                                  │
// │  5  Paso 5  NavigationBar con 4 pestañas                        │
// │  6  Paso 6  SnackBar y AlertDialog                              │
// └──────────────────────────────────────────────────────────────────┘
const int paso = 6;

void main() => runApp(const AppConcesionario());

class AppConcesionario extends StatefulWidget {
  const AppConcesionario({super.key});
  @override
  State<AppConcesionario> createState() => _AppConcesionarioState();
}

class _AppConcesionarioState extends State<AppConcesionario> {
  ThemeMode _themeMode = ThemeMode.system;

  @override
  Widget build(BuildContext context) {
    const seedColor = Color.fromARGB(255, 147, 76, 175);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: _themeMode,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: seedColor, brightness: Brightness.light),
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: seedColor, brightness: Brightness.dark),
        useMaterial3: true,
      ),
      home: switch (paso) {
        1 => const _Paso1(),
        2 => PantallaTema(
       themeMode: _themeMode,
       onToggle:  (mode) => setState(() => _themeMode = mode),
     ),
     3 => const PantallaAppBar(),
     4 => const CatalogoBotones(),
     5 => const PantallaNavegacion(),
     6 => const PantallaDialogs(),
        _ => Scaffold(
            body: Center(child: Text('Paso $paso: crea el widget primero'))),
      },
    );
  }
}

class _Paso1 extends StatelessWidget {
  const _Paso1();

  @override
  Widget build(BuildContext context) {
    final cs   = Theme.of(context).colorScheme;
    final text = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title:           const Text('Concesionario de Motos'),
        backgroundColor: cs.primaryContainer,
        foregroundColor: cs.onPrimaryContainer,
        actions: [
          IconButton(icon: const Icon(Icons.refresh), onPressed: () {}),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.two_wheeler, size: 64, color: cs.primary),
            const SizedBox(height: 16),
            Text(
              'Honda CBR 500R',
              style: text.headlineMedium?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              '2024 · Cilindrada: 500cc · \$8.500',
              style: text.bodyMedium?.copyWith(color: cs.onSurfaceVariant),
            ),
            const SizedBox(height: 24),
            FilledButton.icon(
              onPressed: () {},
              icon:  const Icon(Icons.shopping_cart),
              label: const Text('Agregar al carrito'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}
