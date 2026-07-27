// lib/models/cliente.dart
class Cliente {
  final String id;
  final String nombre;
  final String cedula;
  final String telefono;

  const Cliente({
    required this.id,
    required this.nombre,
    required this.cedula,
    required this.telefono,
  });
}

const clientesSimulados = [
  Cliente(id: '1', nombre: 'Carlos Mendoza', cedula: '1712345678', telefono: '0991234567'),
  Cliente(id: '2', nombre: 'María López',    cedula: '1723456789', telefono: '0987654321'),
  Cliente(id: '3', nombre: 'Pedro Sánchez',  cedula: '1734567890', telefono: '0976543210'),
];
