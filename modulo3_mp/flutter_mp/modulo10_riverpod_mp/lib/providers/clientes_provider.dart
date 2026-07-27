// lib/providers/clientes_provider.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import '../models/cliente.dart';

class ClientesNotifier extends Notifier<List<Cliente>> {
  @override
  List<Cliente> build() => [
    Cliente(id:'1', nombre:'Carlos Mendoza', cedula:'1712345678', telefono:'0991234567', email:'carlos@email.com', favorito:true),
    Cliente(id:'2', nombre:'María López',    cedula:'1723456789', telefono:'0987654321', email:'maria@email.com'),
    Cliente(id:'3', nombre:'Pedro Sánchez',  cedula:'1734567890', telefono:'0976543210', email:'pedro@email.com'),
  ];

  void toggleFavorito(String id) {
    state = state.map((c) =>
        c.id == id
          ? Cliente(id:c.id, nombre:c.nombre, cedula:c.cedula,
                    telefono:c.telefono, email:c.email,
                    favorito:!c.favorito)
          : c
    ).toList();
  }

  void eliminar(String id) {
    state = state.where((c) => c.id != id).toList();
  }

  void agregar(Cliente cliente) {
    state = [...state, cliente];
  }
}

final clientesProvider =
    NotifierProvider<ClientesNotifier, List<Cliente>>(
  ClientesNotifier.new,
);
