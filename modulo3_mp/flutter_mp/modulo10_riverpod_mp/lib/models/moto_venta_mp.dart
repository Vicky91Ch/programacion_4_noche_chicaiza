// lib/models/moto_venta_mp.dart
class MotoVenta {
  final String id;
  final String marca;
  final String modelo;
  final String cilindrada;
  final bool   vendida;
  bool         enOferta;

  MotoVenta({
    required this.id,
    required this.marca,
    required this.modelo,
    required this.cilindrada,
    required this.vendida,
    this.enOferta = false,
  });
}
