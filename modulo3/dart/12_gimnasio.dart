import 'dart:io';

void main() {
  int minutos = -1;
  int suma = 0;
  int clientes = 0;
  double promedio = 0;

  while (minutos != 0) {
    print('Ingrese el total de minutos (0 para salir):');
    minutos = int.parse(stdin.readLineSync()!);

    if (minutos > 0) {
      clientes++;
      suma = suma + minutos;
    }

    if (minutos < 30) {
      print ('Entrenamiento insuficiente');
    } else if (minutos <= 90){
      print ('Entrenamiento adecuado');
    } else {
      print('Entrenamiento intenso');
    }

    if (clientes > 0) {
    promedio = suma / clientes;
    }
    }
  print('La suma total de minutos entrenados es: $suma');
  print('El total de clientes registrados es: $clientes');
  print('Promedio de minutos por cliente: $promedio');
  }
