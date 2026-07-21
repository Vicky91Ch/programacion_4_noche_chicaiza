void main() {
  var marca = 'Yamaha';
  var precio = 7500.99;
  var stock = 10;
  var disponible = true;

  String modelo = 'MT-07';
  int cilindraje = 689;
  double tanque = 14.0;
  bool enOferta = false;

  final concesionario = 'Motos Center';

  const IVA = 0.12;

  print('$marca $modelo - $precio en $concesionario');

  var contador = 0;
  contador = 1;

  final lista = ['MT-07', 'CB190R', 'Ninja 400'];
  lista.add('V-Strom');

  const colores = ['rojo', 'azul'];

  String nombre = 'Carlos';
  String? apellido = null;
  apellido = 'Perez';

  String? ciudad = 'Quito';
  print(ciudad?.length);
  String resultado = ciudad ?? 'Sin ciudad';
  print(resultado);

  if (apellido != null) {
    print(apellido.length);
  }

  late String token;
  token = 'moto-abc-123';
  print(token);
}
