// lib/models/pedido_dto.dart
class PedidoDto {
  final String  motoId;
  final String  clienteId;
  final String? colorMoto;

  const PedidoDto({
    required this.motoId,
    required this.clienteId,
    this.colorMoto,
  });

  Map<String, dynamic> toJson() => {
    'motoId':    motoId,
    'clienteId': clienteId,
    if (colorMoto != null) 'colorMoto': colorMoto,
  };
}
