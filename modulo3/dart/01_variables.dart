void main() {
  // var — tipo inferido (como val en Kotlin)
  var nombre = 'Ana';           // String
  var edad   = 28;              // int
  var precio = 89.99;           // double
  var activo = true;            // bool

  // Tipo explícito
  String apellido = 'García';
  int    stock    = 100;
  double pi       = 3.14159;
  bool   visible  = false;

  // final — no se puede reasignar (como val en Kotlin)
  final ciudad = 'Madrid';
  // ciudad = 'Barcelona';  // ERROR — final no se puede reasignar

  // const — constante en tiempo de compilación (como const en Kotlin)
  const gravedad = 9.8;
  const pi2      = 3.14159;

  // Diferencia clave: final vs const
  final ahora  = DateTime.now();   // OK — se evalúa en runtime
  // const ahora = DateTime.now(); // ERROR — DateTime.now() no es constante de compilación

  print('$nombre $apellido tiene $edad años en $ciudad');

  // var — mutable, tipo inferido
var contador = 0;
contador = 1;          // OK

// final — inmutable referencia, evaluado en runtime
final lista = [1, 2, 3];
lista.add(4);          // OK — la referencia es final, no el contenido
// lista = [5, 6];     // ERROR — no se puede reasignar la referencia

// const — inmutable profundo, evaluado en compilación
const colores = ['rojo', 'azul'];
// colores.add('verde'); // ERROR — lista const es completamente inmutable


  // Tipo no-nullable — NUNCA puede ser null
  String nombre2 = 'Ana';
  // nombre = null;       // ERROR de compilación

  // Tipo nullable — puede ser null (añadir ?)
  String? apellido2 = null;   // OK
  apellido2 = 'García';       // OK

  // Operadores de null safety
  String? ciudad2 = 'Quito';

  // ?. — safe call (igual que en Kotlin)
  print(ciudad2?.length);      // null — no lanza excepción

  // ?? — operador Elvis (igual que ?: en Kotlin)
  String resultado = ciudad2 ?? 'Sin ciudad';
  print(resultado);           // Sin ciudad

  // ! — non-null assertion (igual que !! en Kotlin) — úsalo con precaución
  String ciudadSegura = ciudad2!;  // lanza si ciudad es null

  // Null check con if
  if (apellido2 != null) {
    print(apellido2.length);   // smart cast — ya es String aquí
  }

  // late — inicialización diferida (como lateinit en Kotlin)
  late String token;
  token = 'abc123';           // debe asignarse antes de usar
  print(token);
}