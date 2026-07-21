void main() {
  final marca = 'Yamaha';
  final modelo = 'MT-07';

  print('Moto: $marca $modelo');
  print('${marca.toUpperCase()} ${modelo} - Precio: \$${7500 + 500}');

  final ficha = '''
Marca: $marca
Modelo: $modelo
Precio: ${marca == 'Yamaha' ? '\$7500' : '\$0'}
  ''';
  print(ficha);

  final ruta = r'C:\Users\Motos\Catalogo';
  print(ruta);

  final saludo = 'Bienvenido, ' + marca + '!';

  print('kawasaki'.toUpperCase());
  print('  Honda  '.trim());
  print('Yamaha'.contains('ama'));
  print('CB190R'.replaceAll('R', 'r'));
  print('moto,casco,guantes'.split(','));
  print('Kawasaki'.substring(0, 4));
  print('Ninja'.startsWith('Nin'));
  print('abc'.padLeft(5, '0'));
}
