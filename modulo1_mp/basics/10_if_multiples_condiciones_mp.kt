fun main() {
    println("If con multiples condiciones - Venta de Motos")
    println("Cilindraje de la moto (cc):")
    val cilindraje = readLine()?.toIntOrNull() ?: 0
    val clasificacion = if (cilindraje < 125) {
        "Cilindraje bajo"
    } else if (cilindraje <= 250) {
        "Cilindraje medio"
    } else if (cilindraje <= 600) {
        "Cilindraje alto"
    } else if (cilindraje <= 1000) {
        "Alto rendimiento"
    } else {
        "Super deportiva"
    }
    println("Clasificacion: $clasificacion")
}
