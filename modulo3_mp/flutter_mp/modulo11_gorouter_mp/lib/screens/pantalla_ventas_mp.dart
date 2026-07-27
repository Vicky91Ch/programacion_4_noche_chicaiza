// lib/screens/pantalla_ventas_mp.dart
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:modulo11_gorouter_mp/models/moto_venta_mp.dart';

class PantallaVentas extends StatelessWidget {
  const PantallaVentas({super.key});

  @override
  Widget build(BuildContext context) {
    final cs    = Theme.of(context).colorScheme;
    final motos = motosSimuladas;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Inventario de Motos'),
        backgroundColor: cs.primaryContainer,
        foregroundColor: cs.onPrimaryContainer,
      ),
      body: ListView.builder(
        itemCount: motos.length,
        itemBuilder: (context, i) => ListTile(
          leading: const Icon(Icons.two_wheeler),
          title: Text('${motos[i].marca} ${motos[i].modelo}'),
          onTap: () {
            context.push(
              '/ventas/${motos[i].id}',
              extra: motos[i],
            );
          },
        ),
      ),
    );
  }
}
