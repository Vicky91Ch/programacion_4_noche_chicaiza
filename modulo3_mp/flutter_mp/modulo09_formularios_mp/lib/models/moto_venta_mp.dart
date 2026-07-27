// lib/models/moto_venta_mp.dart
class MotoVenta {
  final String id;
  final String marca;
  final String modelo;
  final int    cilindrada;
  final double precio;
  final String colorMoto;
  final bool   vendida;
  bool         enOferta;

  MotoVenta({
    required this.id,
    required this.marca,
    required this.modelo,
    required this.cilindrada,
    required this.precio,
    required this.colorMoto,
    required this.vendida,
    this.enOferta = false,
  });
}
