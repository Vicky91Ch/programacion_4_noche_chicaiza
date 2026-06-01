import 'dart:io';

void main() {
  int totalVentasVendedor = 0;
  int diasSemanales = 7;

  for (int i = 1; i <= diasSemanales; i++) {
    print('Ingrese las motos vendidas el dia $i:');
    int ventasDia = int.parse(stdin.readLineSync()!);
    totalVentasVendedor += ventasDia;
  }

  double promedioDiario = totalVentasVendedor / diasSemanales;

  print('Total de motos vendidas: $totalVentasVendedor');
  print('Promedio diario: $promedioDiario');

  if (promedioDiario < 3) {
    print('Clasificacion: Bajo rendimiento');
  } else if (promedioDiario >= 3 && promedioDiario <= 8) {
    print('Clasificacion: Rendimiento normal');
  } else {
    print('Clasificacion: Alto rendimiento');
  }
}
