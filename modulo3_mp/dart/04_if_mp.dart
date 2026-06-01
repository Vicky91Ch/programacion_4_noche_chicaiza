void main() {
  int precioMoto = 7500;

  if (precioMoto > 10000) {
    print('Moto premium');
  } else if (precioMoto > 5000) {
    print('Moto gama media');
  } else {
    print('Moto economica');
  }

  String categoria = precioMoto > 10000 ? 'Premium' : 'Estandar';
  print(categoria);

  String? marca;
  String display = marca != null ? marca.toUpperCase() : 'Sin marca';
  String display2 = marca?.toUpperCase() ?? 'Sin marca';
  print(display2);
}
