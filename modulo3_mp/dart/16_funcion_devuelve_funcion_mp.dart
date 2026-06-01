double Function(double) crearMultiplicadorPrecio(double factor) {
  return (double precio) => precio * factor;
}

void main() {
  final conIVA = crearMultiplicadorPrecio(1.12);
  final conDescuento = crearMultiplicadorPrecio(0.90);
  final conRecargo = crearMultiplicadorPrecio(1.05);

  print(conIVA(7500.0));
  print(conDescuento(7500.0));
  print(conRecargo(7500.0));

  bool Function(double) crearValidadorPrecio(double min, double max) {
    return (precio) => precio >= min && precio <= max;
  }

  final esEconomica = crearValidadorPrecio(0, 4000);
  final esPremium = crearValidadorPrecio(10000, double.infinity);

  print(esEconomica(3500.0));
  print(esPremium(12000.0));
  print(esPremium(4500.0));
}
