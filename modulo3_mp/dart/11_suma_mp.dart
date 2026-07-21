import 'dart:io';

void main() {
  double precio = -1;
  double total = 0;

  while (precio != 0) {
    print('Ingrese el precio de la moto (0 para salir):');
    precio = double.parse(stdin.readLineSync()!);

    if (precio != 0) {
      total = total + precio;
      print('Precio: $precio');
    }
  }

  print('El total de cotizaciones es: $total');
  print('Programa finalizado.');
}
