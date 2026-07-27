// lib/providers/ventas_provider_mp.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import '../models/moto_venta_mp.dart';

class VentasNotifier extends Notifier<List<MotoVenta>> {
  @override
  List<MotoVenta> build() => [
    MotoVenta(id:'1', marca:'Honda',    modelo:'CBR 500R',  cilindrada:'500cc',  vendida:true,  enOferta:true),
    MotoVenta(id:'2', marca:'Yamaha',   modelo:'MT-07',     cilindrada:'689cc',  vendida:false, enOferta:false),
    MotoVenta(id:'3', marca:'Kawasaki', modelo:'Z900',      cilindrada:'948cc',  vendida:false, enOferta:true),
  ];

  void toggleOferta(String id) {
    state = state.map((m) =>
        m.id == id
          ? MotoVenta(id:m.id, marca:m.marca, modelo:m.modelo,
                      cilindrada:m.cilindrada, vendida:m.vendida,
                      enOferta:!m.enOferta)
          : m
    ).toList();
  }

  void eliminar(String id) {
    state = state.where((m) => m.id != id).toList();
  }

  void agregar(MotoVenta moto) {
    state = [...state, moto];
  }
}

final ventasProvider =
    NotifierProvider<VentasNotifier, List<MotoVenta>>(
  VentasNotifier.new,
);

final busquedaProvider = StateProvider<String>((ref) => '');

final motosFiltradasProvider = Provider<List<MotoVenta>>((ref) {
  final todos    = ref.watch(ventasProvider);
  final busqueda = ref.watch(busquedaProvider);

  if (busqueda.isEmpty) return todos;

  final q = busqueda.toLowerCase();
  return todos.where((m) =>
      m.marca.toLowerCase().contains(q) || m.modelo.toLowerCase().contains(q)
  ).toList();
});
