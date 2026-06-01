fun main() {
    println("Condicional when - Venta de Motos")
    println("Codigo de marca? (1-7)")
    println("1 -> Yamaha")
    println("2 -> Honda")
    println("3 -> Suzuki")
    println("4 -> Kawasaki")
    println("5 -> Bajaj")
    println("6 -> KTM")
    println("7 -> BMW")
    val codigo = readLine()?.toIntOrNull() ?: 0
    val marca = when (codigo) {
        1 -> "Yamaha"
        2 -> "Honda"
        3 -> "Suzuki"
        4 -> "Kawasaki"
        5 -> "Bajaj"
        6 -> "KTM"
        7 -> "BMW"
        else -> "Marca no registrada"
    }
    println("Marca: $marca")
}
