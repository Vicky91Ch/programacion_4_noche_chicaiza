fun main() {
    println("Conversiones - Venta de Motos")

    val precioEntero: Int = 7500

    val precioDecimal: Double = precioEntero.toDouble()
    val precioLong: Long = precioEntero.toLong()
    val precioString: String = precioEntero.toString()

    println("to Double: $precioDecimal")
    println("to Long: $precioLong")
    println("to String: $precioString")

    println("String a Numerico")
    val cilindraje = "689".toInt()
    val precio = "8499.99".toDouble()

    val invalido = "abc123".toIntOrNull()
    println(invalido)
}
