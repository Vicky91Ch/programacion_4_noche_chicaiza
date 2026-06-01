fun main() {
    println("Funcion Lambda - Venta de Motos")
    val descuento: (Double, Double) -> Double = { precio: Double, porcentaje: Double -> precio * (1 - porcentaje / 100) }
    println(descuento(7500.0, 10.0))
    val recargo: (Double, Double) -> Double = { precio, tasa -> precio * (1 + tasa / 100) }
    println(recargo(7500.0, 12.0))
    val convertirUSD: (Double) -> Double = { it * 1.05 }
    println(convertirUSD(7500.0))
}
