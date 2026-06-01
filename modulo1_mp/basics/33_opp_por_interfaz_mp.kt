data class Moto(
    val id: Int,
    val marca: String,
    val modelo: String,
    val precio: Double,
    val stock: Int,
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
    private val motos = mutableListOf<Moto>()
    private var siguienteId = 1

    fun agregarMoto(marca: String, modelo: String, precio: Double, stock: Int): Moto? {
        val moto = Moto(siguienteId++, marca, modelo, precio, stock)
        motos.add(moto)
        return moto
    }

    fun listar(): List<Moto> = motos.toList()
}

interface Pagable {
    fun procesar(monto: Double): Boolean
    val nombre: String
}

class TarjetaCredito(val numero: String) : Pagable {
    override val nombre = "Tarjeta de credito"
    override fun procesar(monto: Double): Boolean {
        println("Cargando $${"%.2f".format(monto)} a $numero")
        return true
    }
}

class Transferencia(val banco: String) : Pagable {
    override val nombre = "Transferencia"
    override fun procesar(monto: Double): Boolean {
        println("Transferencia de $${"%.2f".format(monto)} desde $banco")
        return true
    }
}

class Efectivo : Pagable {
    override val nombre = "Efectivo"
    override fun procesar(monto: Double): Boolean {
        println("Recibiendo $${"%.2f".format(monto)} en efectivo")
        return true
    }
}

class Financiamiento(val entidad: String, val plazoMeses: Int) : Pagable {
    override val nombre = "Financiamiento"
    override fun procesar(monto: Double): Boolean {
        val cuota = monto / plazoMeses
        println("Financiando $${"%.2f".format(monto)} a $plazoMeses meses con $entidad (cuota: $${"%.2f".format(cuota)})")
        return true
    }
}

fun cobrar(monto: Double, metodoPago: Pagable) {
    println("Procesando pago con ${metodoPago.nombre}...")
    val exito = metodoPago.procesar(monto)
    println(if (exito) "Pago exitoso\n" else "Pago fallido\n")
}

fun main() {
    CatalogoMotos.agregarMoto("Yamaha", "MT-07", 7500.0, 5)
    CatalogoMotos.agregarMoto("Honda", "CB190R", 4200.0, 8)
    CatalogoMotos.agregarMoto("Kawasaki", "Ninja 400", 6800.0, 3)

    println("=== LISTADO DE MOTOS ===")
    val motosExistentes = CatalogoMotos.listar()
    for (m in motosExistentes) {
        println("MOTO: ${(m.marca + " " + m.modelo).padEnd(20)} | PRECIO: $${m.precio}")
    }
    println("----------------------------------------\n")

    val metodos: List<Pagable> = listOf(
        TarjetaCredito("**** **** **** 5678"),
        Transferencia("Banco Pichincha"),
        Efectivo(),
        Financiamiento("Banco del Pacifico", 24)
    )

    println("=== PROCESANDO PAGOS ===")
    for (metodo in metodos) {
        cobrar(7500.0, metodo)
    }
}
