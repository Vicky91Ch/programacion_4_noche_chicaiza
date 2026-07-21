import 'dart:io';

void main() {
  int motos = -1;
  int total = 0;
  int vendedores = 0;
  double promedio = 0;

  while (motos != 0) {
    print('Ingrese motos vendidas por el vendedor (0 para salir):');
    motos = int.parse(stdin.readLineSync()!);

    if (motos > 0) {
      vendedores++;
      total = total + motos;
    }

    if (motos < 5) {
      print('Rendimiento bajo');
    } else if (motos <= 15) {
      print('Rendimiento normal');
    } else {
      print('Rendimiento sobresaliente');
    }

    if (vendedores > 0) {
      promedio = total / vendedores;
    }
  }
  print('Total motos vendidas: $total');
  print('Total vendedores registrados: $vendedores');
  print('Promedio de motos por vendedor: $promedio');
}
