void main() {
  final preciosMotos = [7500, 4200, -1, 8900, 0, 12000, -1, 6500];

  print('=== Procesando con continue ===');
  for (final precio in preciosMotos) {
    if (precio <= 0) {
      print('Precio invalido ignorado');
      continue;
    }
    print('Procesando moto de \$$precio');
  }

  print('\n=== Procesando con break ===');
  for (final precio in preciosMotos) {
    if (precio <= 0) {
      print('Error critico — deteniendo proceso');
      break;
    }
    print('Procesando moto de \$$precio');
  }
}
