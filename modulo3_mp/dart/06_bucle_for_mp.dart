void main() {
  for (int i = 0; i < 5; i++) {
    print('Moto en exhibicion #$i');
  }

  for (int i = 0; i <= 100; i += 25) {
    print('Inventario: $i%');
  }

  for (int i = 5; i >= 1; i--) {
    print('Stock restante: $i');
  }

  final motos = ['MT-07', 'CB190R', 'Ninja 400', 'V-Strom', 'PCX'];

  for (final moto in motos) {
    print(moto);
  }

  motos.forEach((m) => print(m.toLowerCase()));

  final inventario = {'MT-07': 5, 'CB190R': 8, 'Ninja 400': 3, 'V-Strom': 6};
  for (final entrada in inventario.entries) {
    print('${entrada.key} -> stock ${entrada.value}');
  }

  for (final caracter in 'Motos'.split('')) {
    print(caracter);
  }
}
