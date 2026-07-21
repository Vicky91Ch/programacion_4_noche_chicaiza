class Vehiculo {
  final String marca;
  final int year;

  Vehiculo(this.marca, this.year);

  String hacerSonido() => '...';

  void presentarse() {
    print('Soy $marca, anio $year y hago: ${hacerSonido()}');
  }
}

class MotoH extends Vehiculo {
  MotoH(super.marca, super.year);

  @override
  String hacerSonido() => 'Brrum brrum!';

  void acelerar() => print('$marca acelera');
}

class ScooterH extends Vehiculo {
  ScooterH(super.marca, super.year);

  @override
  String hacerSonido() => 'Zum zum!';

  void estacionar() => print('$marca se estaciona facil');
}

void main() {
  final moto = MotoH('Yamaha', 2024);
  final scooter = ScooterH('Honda', 2023);

  moto.presentarse();
  scooter.presentarse();

  moto.acelerar();
  scooter.estacionar();
}
