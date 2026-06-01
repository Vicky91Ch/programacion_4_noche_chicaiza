abstract class MotoTipo {
  String get nombre;
  double calcularPrecio();
}

class MotoEstandar extends MotoTipo {
  final double precioBase;
  MotoEstandar(this.precioBase);
  @override
  String get nombre => 'Moto Estandar';
  @override
  double calcularPrecio() => precioBase;
}

class MotoPremium extends MotoTipo {
  final double precioBase;
  MotoPremium(this.precioBase);
  @override
  String get nombre => 'Moto Premium';
  @override
  double calcularPrecio() => precioBase * 1.5;
}

class MotoDeportivaPoli extends MotoTipo {
  final double precioBase;
  MotoDeportivaPoli(this.precioBase);
  @override
  String get nombre => 'Moto Deportiva';
  @override
  double calcularPrecio() => precioBase * 2.0;
}

void imprimirPrecio(MotoTipo moto) {
  print('${moto.nombre}: \$${moto.calcularPrecio().toStringAsFixed(2)}');
}

void main() {
  final motos = <MotoTipo>[
    MotoEstandar(7500),
    MotoPremium(7500),
    MotoDeportivaPoli(7500),
  ];

  for (final m in motos) {
    imprimirPrecio(m);
  }

  final masCara = motos.reduce((a, b) => a.calcularPrecio() > b.calcularPrecio() ? a : b);
  print('\nMoto mas cara: ${masCara.nombre}');
}
