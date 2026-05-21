
import 'dart:io';

void main() {
  int totalVentasVendedor = 0;
  int diasSemanales = 7;

  // Ciclo for para registrar los 7 días de la semana
  for (int i = 1; i <= diasSemanales; i++) {
    print('Ingrese las ventas del día $i:');
    int ventasDia = int.parse(stdin.readLineSync()!);
    totalVentasVendedor += ventasDia;
  }

  // Cálculos al finalizar la semana del vendedor
  double promedioDiario = totalVentasVendedor / diasSemanales;

  print('Total de ventas: $totalVentasVendedor');
  print('Promedio de ventas: $promedioDiario');

  // Clasificación del rendimiento según el promedio diario
  if (promedioDiario < 10) {
    print('Clasificación de rendimiento: Bajo rendimiento');
  } else if (promedioDiario >= 10 && promedioDiario <= 25) {
    print('Clasificación de rendimiento: Rendimiento normal');
  } else {
    print('Clasificación de rendimiento: Alto rendimiento');
  }
}