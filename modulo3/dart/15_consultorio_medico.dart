import 'dart:io';

void main() {
  int totalPacientes = 0;
  int cantidadDoctores = 0;
  double horas = -1;

  while (horas != 0) {
    print('Ingrese las horas trabajadas por el doctor:');
    horas = double.parse(stdin.readLineSync()!);

    if (horas <= 0) {
      break;
    }

    print('Ingrese la cantidad de pacientes atendidos:');
    int pacientes = int.parse(stdin.readLineSync()!);

    // Logica de la relación de pacientes atendidos por hora
    double pacientesPorHora = pacientes / horas;

    if (pacientesPorHora < 3) {
      print('Atención lenta');
    } else if (pacientesPorHora >= 3 && pacientesPorHora <= 6) {
      print('Atención normal');
    } else {
      print('Atención rápida');
    }

    totalPacientes += pacientes;
    cantidadDoctores++;
  }

  print('Total de pacientes atendidos: $totalPacientes');
  print('Cantidad de doctores registrados: $cantidadDoctores');

  if (cantidadDoctores > 0) {
    double promedio = totalPacientes / cantidadDoctores;
    print('Promedio de pacientes por doctor: $promedio');
  } else {
    print('Promedio de pacientes por doctor: 0');
  }
}