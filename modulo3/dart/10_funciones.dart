//Función sin parámetros y sin retorno
void saludar() {
  print('Hola mundo');
}

//Función con parámetros y sin retorno
void saludoConParametro(String nombre) {
  print('Hola $nombre');
}

//Función sin parámetros y con retorno
int obetnerNumero() {
  return 10;
}

//Función con parámetros y con retorno
int sumar(int a, int b){
  return a+b;
}

//Función flecha (arrow function)
int multiplicar(int a, int b)=>a*b;

//Función con parámetros opcionales
void saludaOpcional(String nombre, [String apellido ='Sin apellido']){
  print("Hola $nombre $apellido");
}

//Función con parámetros nombrados
void registroCliente({
  required String nombre,
  required int edad,
}){
  print ("Hola $nombre edad: $edad");
}

// Dart puede inferir el tipo de retorno, pero es buena práctica declararlo
// explícitamente en funciones públicas para mejorar la legibilidad.

// Con tipo explícito — recomendado
String formatearPrecio(double precio) => '\$${precio.toStringAsFixed(2)}';

// Sin tipo — Dart infiere que retorna String
formatearPrecioSinTipo(double precio) => '\$${precio.toStringAsFixed(2)}';

void main() {
  saludar();
  saludoConParametro('Pedro Perez');
  int numero = obetnerNumero();
  print(numero);
  print('el numero es: ${obetnerNumero()}');
  print('la suma: ${sumar(5,5)}');
  print('la multipicacion : ${multiplicar(5,5)}');
  saludaOpcional('Victoria','Chicaiza');
  saludaOpcional('Vic');
  registroCliente(
    nombre: 'Ana',
    edad: 22,
  );
  print(formatearPrecio(1299.9));
  print(formatearPrecioSinTipo(1299.9));
}