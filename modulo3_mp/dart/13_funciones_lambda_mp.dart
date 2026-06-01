void main() {
  final calcularIVA = (double precio) => precio * 1.12;
  print(calcularIVA(7500.0));

  final calcularCuota = (double precio, int meses) {
    final interes = precio * 0.05;
    return (precio + interes) / meses;
  };
  print(calcularCuota(7500.0, 12));

  final precios = [7500.0, 4200.0, 8900.0, 6800.0];
  precios.sort((a, b) => b.compareTo(a));
  print(precios);
}
