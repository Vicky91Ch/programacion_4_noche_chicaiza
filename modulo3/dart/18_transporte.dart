import 'dart:io';

void main() {
  double totalKilometros = 0;
  int totalViajes = 5;

  // Ciclo for para registrar los 5 viajes del turno
  for (int i = 1; i <= totalViajes; i++) {
    print('Ingrese los kilómetros del viaje $i:');
    double kilometrosViaje = double.parse(stdin.readLineSync()!);

    // Reglas de negocio evaluadas por cada viaje individual
    if (kilometrosViaje < 50) {
      print('Ruta corta');
    } else if (kilometrosViaje >= 50 && kilometrosViaje <= 150) {
      print('Ruta media');
    } else {
      print('Ruta larga');
    }

    // Acumulador de kilómetros dentro del ciclo
    totalKilometros += kilometrosViaje;
  }

  // Cálculos al finalizar el turno
  double consumoCombustible = totalKilometros / 12;
  double promedioKilometros = totalKilometros / totalViajes;

  print('Total de kilómetros recorridos: $totalKilometros');
  print('Total de combustible estimado: $consumoCombustible litros');
  print('Promedio de kilómetros por viaje: $promedioKilometros');
}