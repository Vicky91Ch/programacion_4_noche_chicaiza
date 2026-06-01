class Moto(precioInicial: Double) {

    var precio: Double = precioInicial
        set(value) {
            require(value >= 0) { "El precio no puede ser negativo" }
            field = value
        }

    val precioConIVA: Double
        get() = precio * 1.12

    val precioConDescuento: Double
        get() = precio * 0.90

    val categoria: String
        get() = when {
            precio < 3000 -> "Economica"
            precio < 8000 -> "Media"
            precio < 15000 -> "Premium"
            else -> "Super Premium"
        }
}

fun main() {
    val moto = Moto(7500.0)
    println("Precio: $${moto.precio} = $${moto.precioConIVA} con IVA")
    println(moto.categoria)

    moto.precio = 2500.0
    println("$${moto.precio} -> ${moto.categoria}")
}
