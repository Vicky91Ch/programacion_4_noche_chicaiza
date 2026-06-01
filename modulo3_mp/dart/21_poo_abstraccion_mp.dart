class MotoFactory {
  final String marca;
  final String modelo;
  final double precio;
  final int stock;

  MotoFactory({
    required this.marca,
    required this.modelo,
    required this.precio,
    this.stock = 0,
  });

  MotoFactory.economica()
      : marca = 'Honda',
        modelo = 'CB190R',
        precio = 4200.0,
        stock = 10;

  MotoFactory.premium({required this.marca, required this.modelo})
      : precio = 15000.0,
        stock = 3;

  factory MotoFactory.desdeCatalogo(String linea) {
    final partes = linea.split(',');
    return MotoFactory(
      marca: partes[0],
      modelo: partes[1],
      precio: double.parse(partes[2]),
      stock: int.parse(partes[3]),
    );
  }

  @override
  String toString() => '$marca $modelo - \$$precio (stock: $stock)';
}

void main() {
  final m1 = MotoFactory(marca: 'Yamaha', modelo: 'MT-07', precio: 7500.0, stock: 5);
  final m2 = MotoFactory.economica();
  final m3 = MotoFactory.premium(marca: 'Kawasaki', modelo: 'Ninja 400');
  final m4 = MotoFactory.desdeCatalogo('Suzuki,V-Strom,8900,3');

  print(m1);
  print(m2);
  print(m3);
  print(m4);
}
