double aplicarIVA(double precio) => precio * 1.12;
double aplicarDescuento(double precio) => precio * 0.90;

void main() {
  double Function(double) operacion;

  operacion = aplicarIVA;
  print(operacion(7500.0));

  operacion = aplicarDescuento;
  print(operacion(7500.0));

  final transformaciones = <double Function(double)>[aplicarIVA, aplicarDescuento];
  for (final fn in transformaciones) {
    print(fn(10000.0));
  }
}
