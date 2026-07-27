// lib/screens/pantalla_clientes.dart
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../models/cliente.dart';

class PantallaClientes extends StatelessWidget {
  const PantallaClientes({super.key});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Clientes'),
        backgroundColor: cs.primaryContainer,
        foregroundColor: cs.onPrimaryContainer,
      ),
      body: ListView.builder(
        itemCount: clientesSimulados.length,
        itemBuilder: (context, i) {
          final c = clientesSimulados[i];
          return ListTile(
            leading: const Icon(Icons.person),
            title: Text(c.nombre),
            subtitle: Text('${c.cedula} · ${c.telefono}'),
          );
        },
      ),
    );
  }
}
