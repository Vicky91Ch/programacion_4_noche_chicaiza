fun main() {
    println("Operadores Logicos - Venta de Motos")
    val tieneLicencia = true
    val tieneEfectivo = false
    val creditoAprobado = true
    val mayorEdad = false

    println("Operador And &&")
    println("$tieneLicencia && $tieneEfectivo ${tieneLicencia && tieneEfectivo}")
    println("$tieneLicencia && $creditoAprobado ${tieneLicencia && creditoAprobado}")

    println("Or Logico ||")
    println("$tieneEfectivo || $creditoAprobado ${tieneEfectivo || creditoAprobado}")
    println("$mayorEdad || $tieneEfectivo ${mayorEdad || tieneEfectivo}")

    println("Not Logico !")
    println("! $tieneEfectivo ${!tieneEfectivo}")
    println("! $mayorEdad ${!mayorEdad}")
}
