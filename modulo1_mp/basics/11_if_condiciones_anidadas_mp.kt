fun main() {
    println("If con condiciones anidadas - Venta de Motos")
    println("El cliente tiene historial crediticio? s/n")
    val tieneHistorial = readLine()?.trim()?.lowercase() == "s"
    println("Ingreso mensual del cliente:")
    val ingreso = readLine()?.toIntOrNull() ?: 0
    if (tieneHistorial) {
        println("Cliente con historial crediticio")
        if (ingreso < 500) {
            println("Credito rechazado")
        } else if (ingreso > 2000) {
            println("Credito aprobado")
        } else {
            println("Credito con verificacion adicional")
        }
    } else {
        println("Cliente sin historial crediticio")
        if (ingreso < 1000 || ingreso > 5000) {
            println("Evaluacion manual requerida")
        } else {
            println("Credito con garantia")
        }
    }
}
