// lib/screens/pantalla_clientes.dart
import 'package:flutter/material.dart';
import '../models/cliente.dart';
import '../widgets/fila_cliente.dart';

class PantallaClientes extends StatefulWidget {
  const PantallaClientes({super.key});
  @override
  State<PantallaClientes> createState() => _PantallaClientesState();
}

class _PantallaClientesState extends State<PantallaClientes> {
  final _clientes = [
    Cliente(id:'1', nombre:'Carlos Mendoza', cedula:'1712345678', telefono:'0991234567', email:'carlos@email.com', favorito:true),
    Cliente(id:'2', nombre:'María López',    cedula:'1723456789', telefono:'0987654321', email:'maria@email.com'),
    Cliente(id:'3', nombre:'Pedro Sánchez',  cedula:'1734567890', telefono:'0976543210', email:'pedro@email.com'),
  ];

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        title: Text('Clientes (${_clientes.length})'),
        backgroundColor: cs.primaryContainer,
        foregroundColor: cs.onPrimaryContainer,
      ),
      body: _clientes.isEmpty
          ? Center(child: Column(mainAxisSize: MainAxisSize.min, children: [
              Icon(Icons.people_outline, size: 56, color: cs.onSurfaceVariant),
              const SizedBox(height: 12),
              Text('Sin clientes', style: TextStyle(color: cs.onSurfaceVariant)),
            ]))
          : ListView.separated(
              itemCount: _clientes.length,
              separatorBuilder: (_, __) => const Divider(height: 1, indent: 72),
              itemBuilder: (ctx, i) => FilaCliente(
                cliente: _clientes[i],
                onFavorito: () => setState(() => _clientes[i].favorito = !_clientes[i].favorito),
                onEliminar: () => setState(() => _clientes.removeAt(i)),
              ),
            ),
    );
  }
}
