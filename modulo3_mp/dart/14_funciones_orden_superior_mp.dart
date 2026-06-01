void main() {
  final precios = [2500.0, 4200.0, 6800.0, 8900.0, 15000.0];

  final preciosConIva = precios.map((p) => (p * 1.12).toStringAsFixed(2));
  print(preciosConIva.toList());

  final marcas = ['Yamaha', 'Honda', 'Suzuki', 'Kawasaki'];
  final fichas = marcas.map((m) => 'Marca: $m - disponible en stock');
  print(fichas.toList());

  final cilindraje = [184, 399, 689, 645, 1000];

  final altos = cilindraje.where((c) => c > 600);
  print(altos.toList());

  final medios = cilindraje.where((c) => c >= 300 && c <= 600);
  print(medios.toList());
}
