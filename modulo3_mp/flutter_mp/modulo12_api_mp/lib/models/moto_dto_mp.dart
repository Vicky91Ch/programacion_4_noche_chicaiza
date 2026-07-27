// lib/models/moto_dto_mp.dart
class MotoDto {
  final String id;
  final String marca;
  final String modelo;
  final String cilindrada;
  final double precio;
  final String colorMoto;
  final bool   vendida;

  const MotoDto({
    required this.id,
    required this.marca,
    required this.modelo,
    required this.cilindrada,
    required this.precio,
    required this.colorMoto,
    this.vendida = false,
  });

  factory MotoDto.fromJson(Map<String, dynamic> json) {
    return MotoDto(
      id:         json['id']?.toString() ?? '',
      marca:      json['marca_nombre'] as String? ?? '',
      modelo:     json['modelo']     as String? ?? '',
      cilindrada: json['cilindraje']?.toString() ?? '',
      precio:     double.tryParse(json['precio']?.toString() ?? '') ?? 0,
      colorMoto:  json['color']      as String? ?? '',
      vendida:    (json['estado'] as String?) == 'vendida',
    );
  }

  Map<String, dynamic> toJson() => {
    'id':         id,
    'marca':      marca,
    'modelo':     modelo,
    'cilindrada': cilindrada,
    'precio':     precio,
    'colorMoto':  colorMoto,
    'vendida':    vendida,
  };
}