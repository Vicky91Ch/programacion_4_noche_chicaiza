void main() {
  String codigoMoto = 'MT07';

  switch (codigoMoto) {
    case 'MT07':
      print('Yamaha MT-07');
    case 'CB190':
      print('Honda CB190R');
    case 'N400':
      print('Kawasaki Ninja 400');
    case 'VS650':
      print('Suzuki V-Strom 650');
    default:
      print('Codigo no registrado');
  }

  String codigoMoto2 = 'MT07';

  String descripcion = switch (codigoMoto) {
    'MT07' => 'Yamaha MT-07 - Naked media',
    'CB190' => 'Honda CB190R - Liviana',
    'N400' => 'Kawasaki Ninja 400 - Deportiva',
    'VS650' => 'Suzuki V-Strom - Adventure',
    'PCX' => 'Honda PCX - Scooter',
    'X400' => 'CFMoto 400NK - Naked',
    _ => 'Moto desconocida',
  };

  print(descripcion);

  int cilindraje = 689;

  String categoria = switch (cilindraje) {
    125 || 150 || 184 => 'Bajo (125-184 cc)',
    250 || 300 || 400 => 'Medio (250-400 cc)',
    600 || 650 || 689 => 'Alto (600-689 cc)',
    1000 || 1200 => 'Super deportiva (1000+ cc)',
    _ => 'Desconocido',
  };

  print(categoria);

  double precioMoto = 7500.0;

  String nivel = switch (precioMoto) {
    double p when p >= 15000 => 'PREMIUM - Moto de lujo',
    double p when p >= 8000 => 'ALTA - Moto de alta gama',
    double p when p >= 4000 => 'MEDIA - Moto de gama media',
    double p when p >= 2000 => 'BASICA - Moto economica',
    _ => 'MOTO ENTRY - Accesible',
  };

  print(nivel);
}
