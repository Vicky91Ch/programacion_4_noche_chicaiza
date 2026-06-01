import 'dart:io';

void main () {

  print('Ingrese número para la tabla de multplicar:');
  int numero = int.parse(stdin.readLineSync()!);
  print ('Número: $numero');

  for (int i = 1; i < 11; i++) {
    print('Tabla número $i');

  print ('$numero * $i = ${numero * i}'); 

}
}