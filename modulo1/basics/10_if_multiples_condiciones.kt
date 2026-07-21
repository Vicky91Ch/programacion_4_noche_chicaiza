fun main() {
    println("If con multiples condiciones")
    println("presion arterial sistolica")
    val tiempoEspera = readLine()?. toIntOrNull()?:0
    val clasificacion = if(sistolica <90){
        "Hipotension"
    } else if (sistolica<=119){
        "Normal"
    } else if (sistolica<=139){
        "Elevada"
    } else if (sistolica<=179){
        "Hipertension grado 2"
    } else {
        "Crisis Hipertensiva"
    }
    println("Clasificacion: $clasificacion")
}