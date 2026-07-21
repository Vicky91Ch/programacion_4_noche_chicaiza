fun main() {
    println("When con condiciones - Venta de Motos")
    println("Precio de la moto:")
    val precio = readLine()?.toDoubleOrNull() ?: 0.0
    println("Tiene entrada? s/n")
    val tieneEntrada = readLine()?.trim()?.lowercase() == "s"
    val montoEntrada = if (tieneEntrada) {
        println("Monto de entrada:")
        readLine()?.toDoubleOrNull() ?: 0.0
    } else 0.0
    val cuotaMensual = when {
        !tieneEntrada && precio < 3000 -> precio / 12
        !tieneEntrada && precio >= 3000 -> precio / 24
        tieneEntrada && montoEntrada >= precio * 0.5 -> (precio - montoEntrada) / 6
        tieneEntrada -> (precio - montoEntrada) / 18
        else -> precio / 12
    }
    println("Cuota mensual: $${"%.2f".format(cuotaMensual)}")
}
