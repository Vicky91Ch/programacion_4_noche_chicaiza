void bienvenida() {
  print('Bienvenido a Venta de Motos');
}

void saludarCliente(String nombre) {
  print('Hola $nombre');
}

double obtenerPrecioBase() {
  return 7500.0;
}

double sumarPrecios(double a, double b) {
  return a + b;
}

double aplicarDescuento(double precio, double pct) => precio * (1 - pct / 100);

void saludarOpcional(String nombre, [String apellido = '']) {
  print("Hola $nombre $apellido");
}

void registroClienteMoto({
  required String nombre,
  required double presupuesto,
}) {
  print("Cliente: $nombre presupuesto: \$$presupuesto");
}

String formatearPrecio(double precio) => '\$${precio.toStringAsFixed(2)}';

formatearPrecioSinTipo(double precio) => '\$${precio.toStringAsFixed(2)}';

void main() {
  bienvenida();
  saludarCliente('Pedro Perez');
  double base = obtenerPrecioBase();
  print(base);
  print('precio base: ${obtenerPrecioBase()}');
  print('suma: ${sumarPrecios(7500, 4200)}');
  print('descuento: ${aplicarDescuento(7500, 10)}');
  saludarOpcional('Carlos', 'Mendoza');
  saludarOpcional('Ana');
  registroClienteMoto(
    nombre: 'Luis',
    presupuesto: 8000,
  );
  print(formatearPrecio(1299.9));
  print(formatearPrecioSinTipo(1299.9));
}
