// lib/screens/pantalla_busqueda_mp.dart
import 'package:flutter/material.dart';
import '../widgets/tarjeta_moto_grid_mp.dart';
import '../models/moto_venta_mp.dart';
import '../widgets/fila_venta_mp.dart';

class PantallaBusqueda extends StatefulWidget {
  const PantallaBusqueda({super.key});
  @override
  State<PantallaBusqueda> createState() => _PantallaBusquedaState();
}

class _PantallaBusquedaState extends State<PantallaBusqueda> {
  final _motos = [
    MotoVenta(id:'1', marca:'Honda',    modelo:'CBR 500R',  cilindrada:500,  precio:8500,  colorMoto:'Rojo',   vendida:true,  enOferta:true),
    MotoVenta(id:'2', marca:'Yamaha',   modelo:'MT-07',     cilindrada:689,  precio:7200,  colorMoto:'Azul',   vendida:false, enOferta:false),
    MotoVenta(id:'3', marca:'Kawasaki', modelo:'Z900',      cilindrada:948,  precio:11500, colorMoto:'Verde',  vendida:false, enOferta:true),
    MotoVenta(id:'4', marca:'Suzuki',   modelo:'GSX-R750',  cilindrada:750,  precio:9800,  colorMoto:'Negro',  vendida:true,  enOferta:false),
  ];

  String _busqueda = '';
  bool   _modoGrid = false;

  List<MotoVenta> get _filtrados => _motos
      .where((m) =>
          m.marca.toLowerCase().contains(_busqueda.toLowerCase()) ||
          m.modelo.toLowerCase().contains(_busqueda.toLowerCase()) ||
          m.colorMoto.toLowerCase().contains(_busqueda.toLowerCase()))
      .toList();

  void _toggleOferta(MotoVenta m) => setState(() => m.enOferta = !m.enOferta);
  void _eliminar(MotoVenta m) => setState(() => _motos.removeWhere((x) => x.id == m.id));

  @override
  Widget build(BuildContext context) {
    final cs       = Theme.of(context).colorScheme;
    final filtrados = _filtrados;

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
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
            child: SearchBar(
              hintText: 'Buscar por marca, modelo o color...',
              leading: const Icon(Icons.search),
              trailing: _busqueda.isNotEmpty
                  ? [IconButton(icon: const Icon(Icons.clear), onPressed: () => setState(() => _busqueda = ''))]
                  : null,
              onChanged: (v) => setState(() => _busqueda = v),
              padding: const WidgetStatePropertyAll(EdgeInsets.symmetric(horizontal: 16)),
            ),
          ),
          if (_busqueda.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(left: 16, bottom: 4),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  '${filtrados.length} resultado${filtrados.length == 1 ? '' : 's'}',
                  style: Theme.of(context).textTheme.labelMedium?.copyWith(color: cs.onSurfaceVariant),
                ),
              ),
            ),
          Expanded(
            child: filtrados.isEmpty
                ? Center(child: Column(mainAxisSize: MainAxisSize.min, children: [
                    Icon(Icons.search_off, size: 56, color: cs.onSurfaceVariant),
                    const SizedBox(height: 12),
                    Text('Sin resultados para "$_busqueda"', style: TextStyle(color: cs.onSurfaceVariant)),
                    const SizedBox(height: 8),
                    TextButton(onPressed: () => setState(() => _busqueda = ''), child: const Text('Limpiar búsqueda')),
                  ]))
                : _modoGrid
                    ? GridView.builder(
                        padding: const EdgeInsets.all(12),
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2, childAspectRatio: 1.1, crossAxisSpacing: 8, mainAxisSpacing: 8,
                        ),
                        itemCount: filtrados.length,
                        itemBuilder: (ctx, i) => TarjetaMotoGrid(
                          moto: filtrados[i], onOferta: () => _toggleOferta(filtrados[i]), onEliminar: () => _eliminar(filtrados[i]),
                        ),
                      )
                    : ListView.separated(
                        itemCount: filtrados.length,
                        separatorBuilder: (_, __) => const Divider(height: 1, indent: 72),
                        itemBuilder: (ctx, i) => FilaVenta(
                          venta: filtrados[i], onOferta: () => _toggleOferta(filtrados[i]), onEliminar: () => _eliminar(filtrados[i]),
                        ),
                      ),
          ),
        ],
      ),
    );
  }
}
