import 'dart:io';

void main() {
  int totalPasajeros = 0;
  int totalMinutosRetraso = 0;
  int totalVuelos = 0;
  int cantidadAgentes = 0;
  int vuelos = -1;

  while (vuelos != 0) {
    print('Ingrese la cantidad de vuelos atendidos por el agente:');
    vuelos = int.parse(stdin.readLineSync()!);

    if (vuelos <= 0) {
      break;
    }

    print('Ingrese la cantidad de pasajeros procesados:');
    int pasajeros = int.parse(stdin.readLineSync()!);

    print('Ingrese los minutos totales de retraso:');
    int retraso = int.parse(stdin.readLineSync()!);

    // Logica por cada agente dentro del ciclo
    double pasajerosPorVuelo = pasajeros / vuelos;
    double retrasoPorVuelo = retraso / vuelos;

    // Reglas de negocio basadas en los pasajeros por vuelo
    if (pasajerosPorVuelo < 50) {
      print('Baja eficiencia');
    } else if (pasajerosPorVuelo >= 50 && pasajerosPorVuelo <= 120) {
      print('Eficiencia normal');
    } else {
      print('Alta eficiencia');
    }

    // Acumuladores generales
    totalPasajeros += pasajeros;
    totalMinutosRetraso += retraso;
    totalVuelos += vuelos;
    cantidadAgentes++;
  }

  print('Total de pasajeros procesados: $totalPasajeros');
  print('Total de minutos de retraso acumulados: $totalMinutosRetraso');
  print('Cantidad de agentes registrados: $cantidadAgentes');

  // Promedio de pasajeros por agente
  if (cantidadAgentes > 0) {
    double promedioPasajerosAgente = totalPasajeros / cantidadAgentes;
    print('Promedio de pasajeros por agente: $promedioPasajerosAgente');
  } else {
    print('Promedio de pasajeros por agente: 0');
  }

  // Promedio general de retraso por vuelo
  if (totalVuelos > 0) {
    double promedioRetrasoVuelo = totalMinutosRetraso / totalVuelos;
    print('Promedio general de retraso por vuelo: $promedioRetrasoVuelo');
  } else {
    print('Promedio general de retraso por vuelo: 0');
  }
}