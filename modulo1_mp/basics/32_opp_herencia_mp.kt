open class Vehiculo(val marca: String, val sonido: String) {
    open fun hacerSonido() = println("$marca hace: $sonido")
    open fun descripcion() = "Soy $marca"

    fun mover() = println("$marca se esta moviendo")
}

class Moto(marca: String) : Vehiculo(marca, "Brrum brrum") {
    override fun hacerSonido() {
        super.hacerSonido()
        println("(acelera el motor)")
    }
    override fun descripcion() = "${super.descripcion()}, una moto"
}

class Scooter(marca: String, val electrico: Boolean) : Vehiculo(marca, "Zum zum") {
    override fun descripcion() =
        "${super.descripcion()}, un scooter ${if (electrico) "electrico" else "a gasolina"}"
}

fun main() {
    val moto = Moto("Yamaha")
    moto.hacerSonido()

    val scooter = Scooter("Honda", true)
    println(scooter.descripcion())

    moto.mover()
}
