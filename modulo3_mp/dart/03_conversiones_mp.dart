void main() {
  int precioEntero = 7500;
  double precioDecimal = precioEntero.toDouble();
  String precioTexto = precioEntero.toString();

  int stock = int.parse('10');
  double precio = double.parse('8499.99');

  int? invalido = int.tryParse('abc');
  double? valido = double.tryParse('99');

  Object valor = 'Yamaha';
  if (valor is String) {
    print(valor.length);
  }

  Object obj = 'Honda';
  String str = obj as String;

  String? nullable = null;
  int longitud = nullable?.length ?? 0;
  print(longitud);

  print(double.infinity);
  print(double.nan);
  print(double.maxFinite);
}
