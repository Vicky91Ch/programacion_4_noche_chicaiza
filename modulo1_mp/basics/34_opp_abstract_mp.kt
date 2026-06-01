abstract class MotoBase(val nombre: String) {
    abstract val precio: Double
    abstract val cilindraje: Int
    abstract fun descripcion(): String

    fun comparar(otra: MotoBase): String = when {
        precio > otra.precio -> "$nombre es mas cara que ${otra.nombre}"
        precio < otra.precio -> "$nombre es mas barata que ${otra.nombre}"
        else -> "$nombre y ${otra.nombre} tienen el mismo precio"
    }

    override fun toString() = "${descripcion()} | Precio: ${"%.2f".format(precio)}"
}

class Deportiva(val modelo: String, val precioDeportiva: Double, val cc: Int) : MotoBase(modelo) {
    override val precio: Double get() = precioDeportiva
    override val cilindraje: Int get() = cc
    override fun descripcion() = "Moto deportiva $modelo de $cc cc"
}

class Naked(val modelo: String, val precioNaked: Double, val cc: Int) : MotoBase(modelo) {
    override val precio: Double get() = precioNaked
    override val cilindraje: Int get() = cc
    override fun descripcion() = "Moto naked $modelo de $cc cc"
}

class ScooterMoto(val modelo: String, val precioScooter: Double, val cc: Int) : MotoBase(modelo) {
    override val precio: Double get() = precioScooter
    override val cilindraje: Int get() = cc
    override fun descripcion() = "Scooter $modelo de $cc cc"
}

fun main() {
    val motos: List<MotoBase> = listOf(
        Deportiva("Ninja 400", 6800.0, 399),
        Naked("MT-07", 7500.0, 689),
        ScooterMoto("PCX 150", 3500.0, 149)
    )

    motos.forEach { println(it) }

    val masCara = motos.maxByOrNull { it.precio }
    println("\nMoto mas cara: ${masCara?.nombre}")

    println(motos[0].comparar(motos[1]))
}
