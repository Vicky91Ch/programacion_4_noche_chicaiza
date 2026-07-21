open class CuentaMoto(titular: String, saldoInicial: Double) {

    val titular: String = titular

    private var saldo: Double = saldoInicial

    internal val numeroCuenta: String = "MT${(100000..999999).random()}"

    protected open fun calcularInteres(): Double = saldo * 0.03

    fun depositar(monto: Double) {
        require(monto > 0) { "El monto debe ser positivo" }
        saldo += monto
        println("Depositado: $${"%.2f".format(monto)} | Nuevo saldo: ${consultarSaldo()}")
    }

    fun retirar(monto: Double): Boolean {
        require(monto > 0) { "El monto debe ser positivo" }
        if (monto > saldo) {
            println("Fondos insuficientes")
            return false
        }
        saldo -= monto
        println("Retirado: $${"%.2f".format(monto)} | Nuevo saldo: ${consultarSaldo()}")
        return true
    }

    fun consultarSaldo(): String = "$${"%.2f".format(saldo)}"
}

fun main() {
    val cuenta = CuentaMoto("Luis Perez", 2000.0)

    cuenta.depositar(1500.0)
    cuenta.retirar(800.0)
    cuenta.retirar(5000.0)

    println(cuenta.titular)
    println(cuenta.consultarSaldo())
}
