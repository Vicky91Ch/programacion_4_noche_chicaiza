// lib/screens/pantalla_ventas_mp.dart
import 'package:flutter/material.dart';
import '../widgets/tarjeta_moto_grid_mp.dart';
import '../models/moto_venta_mp.dart';
import '../widgets/fila_venta_mp.dart';

class PantallaVentas extends StatefulWidget {
  const PantallaVentas({super.key});
  @override
  State<PantallaVentas> createState() => _PantallaVentasState();
}

class _PantallaVentasState extends State<PantallaVentas> {
  final _motos = [
    MotoVenta(id:'1', marca:'Honda',    modelo:'CBR 500R',  cilindrada:500,  precio:8500,  colorMoto:'Rojo',   vendida:true,  enOferta:true),
    MotoVenta(id:'2', marca:'Yamaha',   modelo:'MT-07',     cilindrada:689,  precio:7200,  colorMoto:'Azul',   vendida:false, enOferta:false),
    MotoVenta(id:'3', marca:'Kawasaki', modelo:'Z900',      cilindrada:948,  precio:11500, colorMoto:'Verde',  vendida:false, enOferta:true),
    MotoVenta(id:'4', marca:'Suzuki',   modelo:'GSX-R750',  cilindrada:750,  precio:9800,  colorMoto:'Negro',  vendida:true,  enOferta:false),
  ];

  bool _modoGrid = false;

  void _toggleOferta(int i) => setState(() => _motos[i].enOferta = !_motos[i].enOferta);
  void _eliminar(int i) => setState(() => _motos.removeAt(i));

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        title: Text('Inventario (${_motos.length})'),
        backgroundColor: cs.primaryContainer,
        foregroundColor: cs.onPrimaryContainer,
        actions: [
          IconButton(
            icon: Icon(_modoGrid ? Icons.list : Icons.grid_view),
            onPressed: () => setState(() => _modoGrid = !_modoGrid),
            tooltip: _modoGrid ? 'Vista lista' : 'Vista cuadrícula',
          ),
        ],
      ),
      body: _modoGrid
          ? GridView.builder(
              padding: const EdgeInsets.all(12),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, childAspectRatio: 1.1, crossAxisSpacing: 8, mainAxisSpacing: 8,
              ),
              itemCount: _motos.length,
              itemBuilder: (ctx, i) => TarjetaMotoGrid(
                moto: _motos[i], onOferta: () => _toggleOferta(i), onEliminar: () => _eliminar(i),
              ),
            )
          : ListView.separated(
              itemCount: _motos.length,
              separatorBuilder: (_, __) => const Divider(height: 1, indent: 72),
              itemBuilder: (ctx, i) => FilaVenta(
                venta: _motos[i], onOferta: () => _toggleOferta(i), onEliminar: () => _eliminar(i),
              ),
            ),
    );
  }
}
