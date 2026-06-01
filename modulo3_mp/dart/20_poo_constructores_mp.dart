class Moto {
  final String id;
  final String marca;
  final String modelo;
  double precio;
  bool _vendida = false;

  Moto({
    required this.id,
    required this.marca,
    required this.modelo,
    required this.precio,
  });

  bool get vendida => _vendida;
  String get estado => _vendida ? 'vendida' : 'disponible';

  set estadoVendida(bool valor) {
    _vendida = valor;
    print('$marca $modelo: ${valor ? "vendida" : "disponible"}');
  }

  void registrarVenta() {
    _vendida = true;
    print('$marca $modelo registrada como vendida');
  }

  void aplicarDescuento(double pct) {
    precio = precio * (1 - pct / 100);
    print('$marca $modelo nuevo precio: \$$precio');
  }

  String resumen() => '$id | $marca $modelo | \$$precio | $estado';

  @override
  String toString() => 'Moto($marca, $modelo, $estado)';
}

void main() {
  final moto = Moto(
    id: 'MT-001',
    marca: 'Yamaha',
    modelo: 'MT-07',
    precio: 7500.0,
  );

  moto.registrarVenta();
  print(moto.estado);
  print(moto.resumen());
  print(moto);

  moto.estadoVendida = false;
  print(moto.vendida);
}
