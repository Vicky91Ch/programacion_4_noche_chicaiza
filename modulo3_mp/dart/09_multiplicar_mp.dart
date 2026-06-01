import 'dart:io';

void main() {
  print('Ingrese el precio base de la moto:');
  double precio = double.parse(stdin.readLineSync()!);
  print('Precio: $precio');

  for (int i = 1; i < 13; i++) {
    print('Cuota $i: \$${(precio / i).toStringAsFixed(2)}');
  }
}
