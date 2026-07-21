import 'dart:io';

void main() {
  double precio = -1;
  double suma = 0;
  int motos = 0;
  double promedio = 0;

  while (precio != 0) {
    print('Ingrese el precio de la moto (0 para salir):');
    precio = double.parse(stdin.readLineSync()!);

    if (precio > 0) {
      motos++;
      suma = suma + precio;
    }

    if (precio < 3000) {
      print('Moto economica');
    } else if (precio <= 8000) {
      print('Moto gama media');
    } else {
      print('Moto premium');
    }

    if (motos > 0) {
      promedio = suma / motos;
    }
  }
  print('Total precio cotizado: $suma');
  print('Total motos cotizadas: $motos');
  print('Promedio de precio por moto: $promedio');
}
