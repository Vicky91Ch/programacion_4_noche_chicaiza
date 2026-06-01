import 'dart:io';

void main() {
  int motos = -1;
  int total = 0;
  int vendedores = 0;
  double promedio = 0;

  while (motos != 0) {
    print('Ingrese motos vendidas (0 para salir):');
    motos = int.parse(stdin.readLineSync()!);

    if (motos > 0) {
      vendedores++;
      total = total + motos;
    }

    if (motos < 3) {
      print('Venta baja');
    } else if (motos <= 7) {
      print('Venta normal');
    } else {
      print('Venta alta');
    }

    if (vendedores > 0) {
      promedio = total / vendedores;
    }
  }
  print('Total de motos vendidas: $total');
  print('Total de vendedores registrados: $vendedores');
  print('Promedio de motos por vendedor: $promedio');
}
