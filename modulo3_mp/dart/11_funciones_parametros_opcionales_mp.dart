void configurarVentaMoto({
  required String marca,
  required String modelo,
  bool financiamiento = true,
  int plazoMeses = 12,
}) {
  final tipo = financiamiento ? 'financiada' : 'al contado';
  print('Venta $tipo: $marca $modelo (plazo: ${plazoMeses} meses)');
}

String cotizarMoto(String marca, String modelo, [int? year]) {
  if (year != null) {
    return '$marca $modelo $year';
  }
  return '$marca $modelo';
}

String cotizarMotoV2(String marca, String modelo, [int year = 2024]) {
  return '$marca $modelo $year';
}

void main() {
  print(cotizarMoto('Yamaha', 'MT-07'));
  print(cotizarMoto('Yamaha', 'MT-07', 2025));
  print(cotizarMotoV2('Honda', 'CB190R'));

  configurarVentaMoto(
    marca: 'Yamaha',
    modelo: 'MT-07',
    financiamiento: true,
    plazoMeses: 24,
  );

  configurarVentaMoto(
    marca: 'Honda',
    modelo: 'CB190R',
  );
}
