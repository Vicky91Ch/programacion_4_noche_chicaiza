data class Marca(val id: Int, val nombre: String)

data class Moto(
    val id: Int,
    val marca: String,
    val modelo: String,
    val precio: Double,
    val stock: Int,
    val cilindraje: Int,
    val activo: Boolean = true
) {
    val disponible: Boolean get() = activo && stock > 0
    val precioConIva: Double get() = precio * 1.12

    fun aplicarDescuento(porcentaje: Double): Moto {
        require(porcentaje in 0.0..100.0) { "Descuento debe ser entre 0 y 100" }
        return copy(precio = precio * (1 - porcentaje / 100))
    }
}

object CatalogoMotos {
    private val marcas = mutableListOf(
        Marca(1, "Yamaha"),
        Marca(2, "Honda"),
        Marca(3, "Suzuki"),
        Marca(4, "Kawasaki")
    )
    private val motos = mutableListOf<Moto>()
    private var siguienteId = 1

    fun agregarMoto(marca: String, modelo: String, precio: Double, stock: Int, cilindraje: Int): Moto? {
        val moto = Moto(siguienteId++, marca, modelo, precio, stock, cilindraje)
        motos.add(moto)
        return moto
    }

    fun listar(): List<Moto> = motos.toList()
    fun disponibles(): List<Moto> = motos.filter { it.disponible }
    fun porMarca(marca: String): List<Moto> = motos.filter { it.marca.equals(marca, ignoreCase = true) }
    fun buscar(query: String): List<Moto> =
        motos.filter { it.modelo.contains(query, ignoreCase = true) }
}

fun main() {
    CatalogoMotos.agregarMoto("Yamaha", "MT-07", 7500.0, 5, 689)
    CatalogoMotos.agregarMoto("Honda", "CB190R", 4200.0, 0, 184)
    CatalogoMotos.agregarMoto("Suzuki", "V-Strom", 8900.0, 3, 645)
    CatalogoMotos.agregarMoto("Kawasaki", "Ninja 400", 6800.0, 8, 399)

    println("=== Todas las motos ===")
    CatalogoMotos.listar().forEach { m ->
        val estado = if (m.disponible) "Disponible" else "Agotado"
        println("$estado ${m.marca} ${m.modelo} — ${"%.2f".format(m.precioConIva)} (con IVA)")
    }

    println("\n=== Disponibles con 10% descuento ===")
    CatalogoMotos.disponibles()
        .map { it.aplicarDescuento(10.0) }
        .forEach { println("  ${it.marca} ${it.modelo}: ${"%.2f".format(it.precio)}") }

    println("\n=== lista de motos ===")
    for (moto in CatalogoMotos.listar()) {
        println("${moto.marca} ${moto.modelo} stock:${moto.stock} $${moto.precio}")
    }
}
