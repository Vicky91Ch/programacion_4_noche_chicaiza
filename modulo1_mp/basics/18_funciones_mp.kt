fun main() {
    bienvenida()
    saludarCliente("Carlos")
    val precio1 = 7500.0
    val precio2 = 8200.0
    println("Suma de $precio1 + $precio2 = ${sumar(precio1, precio2)}")
    println("Descuento de $precio1 - 500 = ${restar(precio1, 500.0)}")
    operacion()
    println("IVA de $precio1 = ${calcularIVA(precio1)}")
}

fun bienvenida() {
    println("Bienvenido a Venta de Motos")
}

fun saludarCliente(nombre: String) {
    println("Buenas tardes: $nombre")
}

fun sumar(numero1: Double, numero2: Double): Double {
    return numero1 + numero2
}

fun restar(numero1: Double, numero2: Double) = numero1 - numero2

fun operacion() {
    fun cuadrado(x: Double) = x * x
    println(cuadrado(5.0))
}

val calcularIVA = { precio: Double -> precio * 1.12 }
