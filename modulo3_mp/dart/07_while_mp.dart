void main() {
  int motos = 0;
  int presupuesto = 50000;

  while (presupuesto > 0) {
    final precio = presupuesto > 10000 ? 10000 : presupuesto;
    motos++;
    presupuesto -= precio;
    print('Moto $motos: \$$precio (restante: \$$presupuesto)');
  }

  int intentos = 0;
  bool ventaCerrada = false;

  do {
    intentos++;
    print('Intento de venta #$intentos...');
    if (intentos == 3) ventaCerrada = true;
  } while (!ventaCerrada && intentos < 5);

  print(ventaCerrada
      ? 'Venta concretada tras $intentos intentos'
      : 'No se pudo vender');
}
