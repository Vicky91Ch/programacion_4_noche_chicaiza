import 'dart:io';

void main() {
  print('Ingrese la marca de la moto:');
  String? marca = stdin.readLineSync();
  print('Marca: $marca');

  print('Ingrese el precio:');
  double precio = double.parse(stdin.readLineSync()!);
  print('Precio: \$$precio');

  print('Ingrese el stock:');
  int stock = int.parse(stdin.readLineSync()!);
  print('Stock: $stock');
}
