object ConfiguracionMotos {
    val concesionario: String = "Motos Center"
    val direccion: String = "Av. Principal 123"
    private val apiKey: String = "motos-api-secret"

    fun infoTienda() = "$concesionario - $direccion"
    fun headers() = mapOf("Authorization" to "Bearer $apiKey")
}

class Vendedor private constructor(val id: Int, val nombre: String) {
    companion object {
        private var contadorId = 0

        fun crear(nombre: String, codigo: String): Vendedor? {
            if (nombre.isBlank() || codigo.length < 3) return null
            return Vendedor(++contadorId, nombre.trim())
        }

        const val ROL_DEFECTO = "vendedor"
    }
}

fun main() {
    println(ConfiguracionMotos.infoTienda())

    val v = Vendedor.crear("Pedro", "VEN001")
    println(v)
}
