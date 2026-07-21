fun main() {
    println("Control de flujo - Venta de Motos")
    println("If Simple")
    println("Precio de la moto:")
    val precio = readLine()?.toDoubleOrNull() ?: 7500.0
    if (precio >= 10000) {
        println("Moto de gama alta")
    }
    if (precio >= 15000) {
        println("Moto premium")
    }
    println("Precio registrado: $$precio")
}
