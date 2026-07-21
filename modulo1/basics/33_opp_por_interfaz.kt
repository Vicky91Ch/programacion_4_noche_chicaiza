// --- BLOQUE 1: PRODUCTOS Y CATÁLOGO ---

data class Categoria(val id: Int, val nombre: String)

data class Producto(
    val id: Int,
    val nombre: String,
    val precio: Double,
    val stock: Int,
    val categoria: Categoria,
    val activo: Boolean = true
) {
    val disponible: Boolean get() = activo && stock > 0
    val precioConIva: Double get() = precio * 1.19

    fun aplicarDescuento(porcentaje: Double): Producto {
        require(porcentaje in 0.0..100.0) { "Descuento debe ser entre 0 y 100" }
        return copy(precio = precio * (1 - porcentaje / 100))
    }
}

object CatalogoProductos {
    private val categorias = mutableListOf(
        Categoria(1, "Periféricos"),
        Categoria(2, "Pantallas"),
        Categoria(3, "Audio")
    )
    private val productos = mutableListOf<Producto>()
    private var siguienteId = 1

    fun agregarProducto(nombre: String, precio: Double, stock: Int, categoriaId: Int): Producto? {
        val categoria = categorias.find { it.id == categoriaId } ?: return null
        val producto = Producto(siguienteId++, nombre, precio, stock, categoria)
        productos.add(producto)
        return producto
    }

    fun listar(): List<Producto> = productos.toList()
}

// --- BLOQUE 2: PAGOS Y POLIMORFISMO ---

interface Pagable {
    fun procesar(monto: Double): Boolean
    val nombre: String
}

class TarjetaCredito(val numero: String) : Pagable {
    override val nombre = "Tarjeta de crédito"
    override fun procesar(monto: Double): Boolean {
        println("💳 Cargando $${"%.2f".format(monto)} a $numero")
        return true
    }
}

class PayPal(val email: String) : Pagable {
    override val nombre = "PayPal"
    override fun procesar(monto: Double): Boolean {
        println("🅿️ Enviando $${"%.2f".format(monto)} a $email")
        return true
    }
}

class Efectivo : Pagable {
    override val nombre = "Efectivo"
    override fun procesar(monto: Double): Boolean {
        println("💵 Recibiendo $${"%.2f".format(monto)} en efectivo")
        return true
    }
}

class Cheque(val numero: String, val banco: String) : Pagable {
    override val nombre = "Cheque"
    override fun procesar(monto: Double): Boolean {
        println("📝 Procesando cheque No. $numero del banco $banco por $${"%.2f".format(monto)}")
        return true
    }
}

fun cobrar(monto: Double, metodoPago: Pagable) {
    println("Procesando pago con ${metodoPago.nombre}...")
    val exito = metodoPago.procesar(monto)
    println(if (exito) "✅ Pago exitoso\n" else "❌ Pago fallido\n")
}

// --- FUNCIÓN PRINCIPAL ---

fun main() {
    // Registro de productos iniciales
    CatalogoProductos.agregarProducto("Teclado mecánico", 89.99, 15, 1)
    CatalogoProductos.agregarProducto("Monitor 27\"", 349.99, 5, 2)
    CatalogoProductos.agregarProducto("Auriculares BT", 149.99, 8, 3)

    // 1. RECORRIDO DE PRODUCTOS USANDO UN FOR SIMPLE (Llamando al objeto)
    println("=== LISTADO DE PRODUCTOS (CICLO FOR) ===")
    val productosExistentes = CatalogoProductos.listar()
    for (p in productosExistentes) {
        println("PRODUCTO: ${p.nombre.padEnd(20)} | PRECIO: $${p.precio}")
    }
    println("----------------------------------------\n")


    val metodos: List<Pagable> = listOf(
        TarjetaCredito("**** **** **** 1234"),
        PayPal("ana@test.com"),
        Efectivo(),
        Cheque("000-456", "Banco Pichincha")
    )

    println("=== PROCESANDO PAGOS ===")
    for (metodo in metodos) {
        cobrar(150.0, metodo)
    }
}