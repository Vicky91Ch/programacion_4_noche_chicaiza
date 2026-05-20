import 'dart:io';

void main() {
  int muebles = -1;
  int total = 0;
  int trabajadores = 0;
  double promedio = 0;

  while (muebles!= 0) {
    print('Ingrese el total de muebles (0 para salir):');
    muebles = int.parse(stdin.readLineSync()!);

    if (muebles > 0) {
      trabajadores++;
      total = total + muebles;
    }

    if (muebles < 3) {
      print ('Produccion baja');
    } else if (muebles <= 7){
      print ('Produccion normal');
    } else {
      print('Produccion alta');
    }

    if (trabajadores > 0) {
    promedio = total / trabajadores;
    }
    }
  print('La suma total de minutos entrenados es: $total');
  print('El total de trabajadores registrados es: $trabajadores');
  print('Promedio de muebles por trabajador: $promedio');
  }
