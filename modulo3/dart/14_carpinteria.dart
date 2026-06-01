import 'dart:io';

void main() {
  int tablas = -1;
  int total = 0;
  int operarios = 0;
  double promedio = 0;

  while (tablas!= 0) {
    print('Ingrese el total de tablas (0 para salir):');
    tablas = int.parse(stdin.readLineSync()!);

    if (tablas > 0) {
      operarios++;
      total = total + tablas;
    }

    if (tablas < 15) {
      print ('Trabajo lento');
    } else if (tablas <= 40){
      print ('Trabajo eficiente');
    } else {
      print('Trabajo sobresaliente');
    }

    if (operarios > 0) {
    promedio = total / operarios;
    }
    }
  print('La suma total tablas cortadas: $total');
  print('El total de operarios registrados es: $operarios');
  print('Promedio de tablas por operario: $promedio');
  }
