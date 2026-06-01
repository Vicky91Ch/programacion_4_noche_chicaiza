fun main() {
    println("CICLOS for - Venta de Motos")
    for (i in 1..5) {
        println("Moto en exhibicion #$i")
    }
    println("until")
    for (i in 1 until 5) {
        println("Modelo disponible #$i")
    }
    println("downTo")
    for (i in 10 downTo 1) {
        println("Stock restante: $i")
    }
    println("listas")
    val modelos = listOf("MT-07", "CB190R", "V-Strom", "Ninja 400")
    for (modelo in modelos) {
        println(modelo)
    }
    println("indice valor")
    for ((index, valor) in modelos.withIndex()) {
        println("$index, $valor")
    }
    println("break")
    for (i in 1..5) {
        if (i == 3) break
        println("Moto #$i")
    }
    println("continue")
    for (i in 1..5) {
        if (i == 3) continue
        println("Moto #$i")
    }
}
