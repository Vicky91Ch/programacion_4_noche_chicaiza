fun main() {
    println("Ciclos repeat - Venta de Motos")
    println("Cuantas cotizaciones desea realizar?")
    val cotizaciones = readLine()?.toIntOrNull() ?: 3
    var totalPresupuestos = 0.0
    repeat(cotizaciones) { i ->
        println("Cotizacion ${i + 1} (precio de moto):")
        val precio = readLine()?.toDoubleOrNull() ?: 0.0
        totalPresupuestos += precio
    }
    val promedio = totalPresupuestos / cotizaciones
    println("Precio promedio cotizado: $$promedio")
    println("Clasificacion: ${
        when {
            promedio < 3000 -> "Economica"
            promedio <= 8000 -> "Media"
            else -> "Premium"
        }
    }")
}
