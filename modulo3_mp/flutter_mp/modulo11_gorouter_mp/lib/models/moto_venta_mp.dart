// lib/models/moto_venta_mp.dart
class MotoVenta {
  final String id;
  final String marca;
  final String modelo;
  final String cilindrada;
  final double precio;
  final String colorMoto;

  const MotoVenta({
    required this.id,
    required this.marca,
    required this.modelo,
    required this.cilindrada,
    required this.precio,
    required this.colorMoto,
  });
}

const motosSimuladas = [
  MotoVenta(id: '1', marca: 'Honda',    modelo: 'CBR 500R',  cilindrada: '500cc',  precio: 8500,  colorMoto: 'Rojo'),
  MotoVenta(id: '2', marca: 'Yamaha',   modelo: 'MT-07',     cilindrada: '689cc',  precio: 7200,  colorMoto: 'Azul'),
  MotoVenta(id: '3', marca: 'Kawasaki', modelo: 'Z900',      cilindrada: '948cc',  precio: 11500, colorMoto: 'Verde'),
];
