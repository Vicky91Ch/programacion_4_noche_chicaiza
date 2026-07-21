fun main() {
    val marca = "Yamaha"
    val modelo = "MT-07"
    val year: Int = 2024
    var precio = 7500.0
    precio = precio + 500

    println("$marca $modelo ($year) - $$precio")

    val cilindraje: Short = 689
    val kilometraje: Long = 0
    val tanque: Float = 14.0f
    val peso: Double = 184.0

    println("Cilindraje: $cilindraje cc")
    println("Kilometraje: $kilometraje km")
    println("Tanque: $tanque L")
    println("Peso: $peso kg")

    val disponible: Boolean = true
    val color: Char = 'N'
    val tipo: String = "Naked"
    println("Tipo: $tipo, Color: $color, Disponible: $disponible")
}
