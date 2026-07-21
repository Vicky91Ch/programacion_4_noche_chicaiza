abstract class MotoBase {
  String get nombre;
  double calcularPrecio();
  int calcularCilindraje();

  void describir() {
    print('$nombre — precio: \$${calcularPrecio().toStringAsFixed(2)}, '
        'cilindraje: ${calcularCilindraje()} cc');
  }
}

class MotoDeportiva extends MotoBase {
  final double precio;
  final int cc;
  MotoDeportiva(this.precio, this.cc);

  @override
  String get nombre => 'Moto Deportiva';
  @override
  double calcularPrecio() => precio;
  @override
  int calcularCilindraje() => cc;
}

class MotoNaked extends MotoBase {
  final double precio;
  final int cc;
  MotoNaked(this.precio, this.cc);

  @override
  String get nombre => 'Moto Naked';
  @override
  double calcularPrecio() => precio;
  @override
  int calcularCilindraje() => cc;
}

void main() {
  final motos = <MotoBase>[MotoDeportiva(12000, 1000), MotoNaked(7500, 689)];
  for (final m in motos) {
    m.describir();
  }
}
