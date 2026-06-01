import 'dart:io';

void main() {
  int numero = -1;
  int suma = 0;

  while (numero != 0) {
    print('Ingrese un número entero (0 para salir):');
    numero = int.parse(stdin.readLineSync()!);

    if (numero != 0) {
      suma = suma + numero;
      print('Número: $numero');
    }
  }

  print('La suma total es: $suma');
  print('Programa finalizado.');
}