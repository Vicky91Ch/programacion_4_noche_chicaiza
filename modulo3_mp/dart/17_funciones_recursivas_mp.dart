int calcularCuotas(int meses) {
  if (meses <= 1) return 1;
  return meses + calcularCuotas(meses - 1);
}

int calcularComisiones(int ventas) {
  if (ventas <= 1) return ventas;
  return calcularComisiones(ventas - 1) + calcularComisiones(ventas - 2);
}

int contarAccesorios(Map<String, dynamic> categoria) {
  int total = 0;
  for (final entrada in categoria.entries) {
    if (entrada.value is Map) {
      total += contarAccesorios(entrada.value as Map<String, dynamic>);
    } else {
      total++;
    }
  }
  return total;
}

void main() {
  print(calcularCuotas(6));
  print(calcularComisiones(10));

  final catalogoAccesorios = {
    'cascos': {
      'integrales': {'MT Shield': true, 'ZX-1': true},
      'modulares': {'Neotec 3': true},
    },
    'ropa': {'chaquetas': {'Alpinestars': true}, 'pantalones': {'Rift': true}},
    'guantes': true,
    'catalogo.pdf': true,
  };

  print('Total accesorios: ${contarAccesorios(catalogoAccesorios)}');
}
