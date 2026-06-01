fun main() {
    println("Utilidades de listas - Venta de Motos")
    val precios = listOf(2500.0, 4200.0, 6800.0, 7500.0, 8900.0, 12000.0, 15000.0, 18000.0, 22000.0, 30000.0)
    println(precios)
    val conIVA = precios.map { it * 1.12 }
    println(conIVA)
    val preciosTexto = precios.map { "$$it" }
    println(preciosTexto)

    println("Filter")
    val economicas = precios.filter { it < 5000 }
    println(economicas)
    val premium = precios.filter { it > 10000 }
    println(premium)
    val mediaPremium = precios.filter { it > 5000 && it < 15000 }
    println(mediaPremium)
    val noEconomicas = precios.filterNot { it < 5000 }
    println(noEconomicas)
}
