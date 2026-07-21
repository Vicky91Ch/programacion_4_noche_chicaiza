enum class EstadoMoto(val descripcion: String, val esTerminal: Boolean) {
    EN_EXHIBICION("Disponible en sala de ventas", false),
    EN_PRUEBA("Siendo probada por cliente", false),
    VENDIDA("Vendida exitosamente", true),
    RESERVADA("Apartada con senal", false),
    EN_MANTENIMIENTO("En taller de servicio", true);

    fun puedeTransicionarA(siguiente: EstadoMoto): Boolean = when (this) {
        EN_EXHIBICION -> siguiente == EN_PRUEBA || siguiente == RESERVADA || siguiente == VENDIDA
        EN_PRUEBA -> siguiente == EN_EXHIBICION || siguiente == VENDIDA
        RESERVADA -> siguiente == VENDIDA || siguiente == EN_EXHIBICION
        else -> false
    }
}

fun main() {
    val estado = EstadoMoto.EN_EXHIBICION
    println(estado.descripcion)
    println(estado.esTerminal)

    val icono = when (estado) {
        EstadoMoto.EN_EXHIBICION -> "Disponible"
        EstadoMoto.EN_PRUEBA -> "En prueba"
        EstadoMoto.VENDIDA -> "Vendida"
        EstadoMoto.RESERVADA -> "Reservada"
        EstadoMoto.EN_MANTENIMIENTO -> "En taller"
    }
    println(icono)

    println(estado.puedeTransicionarA(EstadoMoto.EN_PRUEBA))
}
