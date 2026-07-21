import 'dart:io';

void main() {
  int totalMotosVendidas = 0;
  int cantidadVendedores = 0;
  double horas = -1;

  while (horas != 0) {
    print('Ingrese las horas trabajadas por el vendedor:');
    horas = double.parse(stdin.readLineSync()!);

    if (horas <= 0) {
      break;
    }

    print('Ingrese la cantidad de motos vendidas:');
    int motos = int.parse(stdin.readLineSync()!);

    double motosPorHora = motos / horas;

    if (motosPorHora < 0.5) {
      print('Venta lenta');
    } else if (motosPorHora >= 0.5 && motosPorHora <= 2) {
      print('Venta normal');
    } else {
      print('Venta rapida');
    }

    totalMotosVendidas += motos;
    cantidadVendedores++;
  }

  print('Total de motos vendidas: $totalMotosVendidas');
  print('Cantidad de vendedores registrados: $cantidadVendedores');

  if (cantidadVendedores > 0) {
    double promedio = totalMotosVendidas / cantidadVendedores;
    print('Promedio de motos por vendedor: $promedio');
  } else {
    print('Promedio de motos por vendedor: 0');
  }
}
