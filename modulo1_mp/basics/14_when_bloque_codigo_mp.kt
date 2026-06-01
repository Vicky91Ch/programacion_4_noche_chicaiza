fun main() {
    println("When con bloques de codigo - Venta de Motos")
    println("Modelo de moto:")
    val modelo = readLine()?.trim() ?: ""
    println("Tipo de moto DEPORTIVA/NAKED/CRUISER/ENDURO/SCOOTER:")
    val tipo = readLine()?.trim()?.uppercase() ?: ""

    when (tipo) {
        "DEPORTIVA" -> {
            println("DEPORTIVA - Modelo: $modelo")
            println("Alto rendimiento en pista")
            println("Recomendar casco integral")
        }
        "NAKED" -> {
            println("NAKED - Modelo: $modelo")
            println("Moto urbana versatil")
            println("Recomendar proteccion basica")
        }
        "CRUISER" -> println("CRUISER: $modelo, ideal para rutas largas")
        "ENDURO" -> println("ENDURO: $modelo, ideal para todo terreno")
        "SCOOTER" -> println("SCOOTER: $modelo, ideal para ciudad")
        else -> println("Tipo no reconocido")
    }
    println("Cilindraje:")
    val cilindraje = readLine()?.toIntOrNull() ?: 0
    val categoria = when (cilindraje) {
        in 0..125 -> "Bajo"
        in 126..400 -> "Medio"
        in 401..600 -> "Alto"
        in 601..1000 -> "Premium"
        else -> "Super deportiva"
    }
    println("$cilindraje cc -> $categoria")
}
