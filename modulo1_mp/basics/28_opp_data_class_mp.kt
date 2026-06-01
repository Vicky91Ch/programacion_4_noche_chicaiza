data class Moto(
    val id: Int,
    val marca: String,
    val modelo: String,
    val precio: Double,
    val cilindraje: Int,
    val disponible: Boolean = true
)

fun main() {
    val m1 = Moto(1, "Yamaha", "MT-07", 7500.0, 689)
    val m2 = Moto(1, "Yamaha", "MT-07", 7500.0, 689)
    val m3 = Moto(2, "Honda", "CB190R", 4200.0, 184)

    println(m1)
    println(m1 == m2)
    println(m1 == m3)

    val motoOferta = m1.copy(precio = 5999.0)
    val motoNoDisponible = m1.copy(disponible = false)

    val (id, marca, modelo, precio) = m1
    println("$id: $marca $modelo — $$precio")

    listOf(m1, m3).forEach { (id2, marca2, modelo2, precio2) ->
        println("[$id2] $marca2 $modelo2: $$precio2")
    }
}
