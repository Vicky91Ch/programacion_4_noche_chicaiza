List<int> filtrarPrecios(List<int> lista, bool Function(int) criterio) {
  return lista.where(criterio).toList();
}

bool esEconomica(int n) => n < 5000;
bool esPremium(int n) => n > 10000;

void main() {
  final precios = [2500, 4200, 6800, 12000, 15000, 8900, 3500, 22000];

  print(filtrarPrecios(precios, esEconomica));
  print(filtrarPrecios(precios, esPremium));

  print(filtrarPrecios(precios, (n) => n >= 5000 && n <= 10000));
}
