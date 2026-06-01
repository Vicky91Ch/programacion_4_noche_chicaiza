fun main() {
    println("CICLOS while - Venta de Motos")
    println("while basico")
    var contador = 1
    while (contador <= 5) {
        println("Cliente #$contador en espera")
        contador++
    }
    println("do while")
    contador = 1
    do {
        println("Promocion #$contador aplicada")
        contador++
    } while (contador <= 5)
    println("break - continue")
    contador = 1
    while (contador <= 10) {
        contador++
        if (contador == 3) continue
        if (contador == 7) break
        println("Venta #$contador procesada")
    }
    var input: String
    while (true) {
        println("Escribe 'salir' para terminar la venta:")
        input = readLine() ?: ""
        if (input == "salir") break
        println("Registraste: $input")
    }
}
