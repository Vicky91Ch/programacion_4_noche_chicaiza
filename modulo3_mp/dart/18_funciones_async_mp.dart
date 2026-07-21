import 'dart:io';

Future<String> obtenerCotizacionMoto() async {
  await Future.delayed(Duration(milliseconds: 200));
  return 'Yamaha MT-07 - \$7500';
}

void main() async {
  print('Consultando cotizacion...');
  final cotizacion = await obtenerCotizacionMoto();
  print('Cotizacion: $cotizacion');
  print('Consulta completada');
}
