// lib/models/cliente.dart
class Cliente {
  final String id;
  final String nombre;
  final String cedula;
  final String telefono;
  final String email;
  bool         favorito;

  Cliente({
    required this.id,
    required this.nombre,
    required this.cedula,
    required this.telefono,
    required this.email,
    this.favorito = false,
  });
}
