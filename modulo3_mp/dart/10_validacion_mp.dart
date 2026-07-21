import 'dart:io';

void main() {
  print('Ingrese el precio de la moto:');
  double precio = double.parse(stdin.readLineSync()!);
  print('Precio: $precio');

  if (precio > 10000) {
    print('La moto de \$$precio es Premium');
  } else if (precio < 4000) {
    print('La moto de \$$precio es Economica');
  } else {
    print('La moto de \$$precio es Gama Media');
  }
}
