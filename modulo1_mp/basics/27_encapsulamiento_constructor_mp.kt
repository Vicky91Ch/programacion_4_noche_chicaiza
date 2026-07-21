class Moto(val marca: String, val modelo: String, val precio: Double) {
    val descripcion: String get() = "$marca $modelo"
    val precioConIva: Double get() = precio * 1.12

    constructor(marca: String, modelo: String) : this(marca, modelo, 0.0)
    constructor(marca: String) : this(marca, "Desconocido", 0.0)

    override fun toString() = "$marca $modelo | $$precio"
}

fun main() {
    val m1 = Moto("Yamaha", "MT-07", 7500.0)
    val m2 = Moto("Honda", "CB190R")
    val m3 = Moto("Suzuki")

    println(m1)
    println(m2)
    println(m3)
}
