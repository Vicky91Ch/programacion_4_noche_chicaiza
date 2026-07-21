fun main() {
    println("Control de flujo - Venta de Motos")
    println("If Dos Caminos")
    println("Tiene financiamiento aprobado? s/n")

    val tieneFinanciamiento = readLine()?.trim()?.lowercase() == "s"
    println("Precio de la moto? $")

    val precioMoto = readLine()?.toDoubleOrNull() ?: 0.0

    if (tieneFinanciamiento) {
        val cuotaInicial = precioMoto * 0.30
        println("Cuota inicial: $$cuotaInicial Financia: $${precioMoto - cuotaInicial}")
    } else {
        println("Pago total: $$precioMoto")
    }
}
