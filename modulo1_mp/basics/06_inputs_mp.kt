fun main() {
    println("Registro de Cliente - Venta de Motos")
    println("Nombre del cliente:")

    val nombre = readLine() ?: "anonimo"
    println("Hola $nombre")

    println("Presupuesto maximo:")
    val presupuesto = readLine()?.toDoubleOrNull() ?: 0.00
    println("Su presupuesto es: $$presupuesto")

    val doblePresupuesto = presupuesto * 2
    println("El doble de su presupuesto es: $$doblePresupuesto")
}
