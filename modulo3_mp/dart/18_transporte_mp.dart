import 'dart:io';

void main() {
  double totalKilometros = 0;
  int viajesMoto = 5;

  for (int i = 1; i <= viajesMoto; i++) {
    print('Ingrese los kilometros del viaje $i:');
    double kilometrosViaje = double.parse(stdin.readLineSync()!);

    if (kilometrosViaje < 20) {
      print('Recorrido corto');
    } else if (kilometrosViaje >= 20 && kilometrosViaje <= 80) {
      print('Recorrido medio');
    } else {
      print('Recorrido largo');
    }

    totalKilometros += kilometrosViaje;
  }

  double consumoCombustible = totalKilometros / 25;
  double promedioKilometros = totalKilometros / viajesMoto;

  print('Total de kilometros recorridos: $totalKilometros');
  print('Total de combustible estimado: $consumoCombustible litros');
  print('Promedio de kilometros por viaje: $promedioKilometros');
}
