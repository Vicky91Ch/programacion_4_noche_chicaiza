
fun main() {
  println("Listas")
  println("Inmutables")
  val frutas=listOf("manzana","banana","cereza","pera","piña")
  println(frutas)
  println("Size: ${frutas.size}")
  println("Mostrar el elemento indice 0: ${frutas[0]}")
  println("Mostrar primer elemento: ${frutas.first()}")
  println("Mostrar ultimo elemento: ${frutas.last()}")
  
  println("Mostrar el elemento indice 2: ${frutas.get(2)}")
  println("Mostrar el contenido segun indice: ${frutas.indexOf("banana")}")
  println("Verificar existencia de un elemento: ${frutas.contains("banana")}")
  println("Verificar existencia de un elemento: ${"naranja" in frutas}")
  
  //Sublista
  println("Sublista: ${frutas.subList(1,4)}")
  println("Tomar primeros 2 elementos: ${frutas.take(2)}")
  println("Suprimir tres primeros elemento: ${frutas.drop(3)}")
  println("Tomar los ultimos dos elementos: ${frutas.takeLast(2)}")
  println(frutas)
  print("Mutables")
  val colores=mutableListOf("blanco", "azul", "amarillo", "rojo")
  println(colores)
  colores.add("verde")
  println(colores)
  colores.add(1,"morado")
  println(colores)
  colores.remove("verde")
  println(colores)
  colores[1]="gris"
  println(colores)
  
  println("Array deque")
  val numeros= ArrayDeque<Int>()
  println(numeros)
  numeros.addFirst(1)
  println(numeros)
  numeros.addFirst(3)
  println(numeros)
  numeros.addLast(2)
  println(numeros)
  numeros.removeFirst()
  println(numeros)
  numeros.removeLast()
  println(numeros)
  
}