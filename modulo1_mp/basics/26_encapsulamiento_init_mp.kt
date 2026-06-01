class Cliente(val nombre: String, val email: String, val telefono: String) {
    val nombreNormalizado: String
    val dominioEmail: String

    init {
        require(nombre.isNotBlank()) { "El nombre no puede estar vacio" }
        require(email.contains("@")) { "Email invalido: $email" }
        require(telefono.length >= 7) { "Telefono invalido" }

        nombreNormalizado = nombre.trim().lowercase()
        dominioEmail = email.substringAfter("@")
    }
}

fun main() {
    val c = Cliente("  Maria Lopez  ", "maria@motos.com", "0987654321")
    println(c.nombreNormalizado)
    println(c.dominioEmail)
}
