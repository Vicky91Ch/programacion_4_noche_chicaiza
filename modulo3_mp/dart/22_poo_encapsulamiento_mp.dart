class VentaMoto {
  final String cliente;
  double _precio;

  VentaMoto(this.cliente, double precioInicial) : _precio = precioInicial;

  double get precio => _precio;

  void aplicarDescuento(double pct) {
    if (pct <= 0) throw ArgumentError('El descuento debe ser positivo');
    _precio = _precio * (1 - pct / 100);
    print('Descuento aplicado. Nuevo precio: \$$_precio');
  }

  void agregarRecargo(double monto) {
    if (monto <= 0) throw ArgumentError('El recargo debe ser positivo');
    if (monto > _precio * 0.5) throw StateError('Recargo excesivo');
    _precio += monto;
    print('Recargo de \$$monto. Precio final: \$$_precio');
  }
}

void main() {
  final venta = VentaMoto('Ana Lopez', 7500.0);

  venta.aplicarDescuento(10.0);
  venta.agregarRecargo(200.0);
  print(venta.precio);
}
