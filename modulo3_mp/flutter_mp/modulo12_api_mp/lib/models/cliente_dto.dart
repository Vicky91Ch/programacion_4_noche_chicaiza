// lib/models/cliente_dto.dart
class ClienteDto {
  final String id;
  final String nombre;
  final String cedula;
  final String telefono;
  final String email;

  const ClienteDto({
    required this.id,
    required this.nombre,
    required this.cedula,
    required this.telefono,
    this.email = '',
  });

  factory ClienteDto.fromJson(Map<String, dynamic> json) {
    return ClienteDto(
      id:       json['id']       as String? ?? '',
      nombre:   json['nombre']   as String? ?? '',
      cedula:   json['cedula']   as String? ?? '',
      telefono: json['telefono'] as String? ?? '',
      email:    json['email']    as String? ?? '',
    );
  }

  Map<String, dynamic> toJson() => {
    'id':       id,
    'nombre':   nombre,
    'cedula':   cedula,
    'telefono': telefono,
    'email':    email,
  };
}
