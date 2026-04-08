//Declaración Variables
fun main() {
    // Val Inmutable
    val nombre="Ana"
    val edad: Int = 28
    // Var Mutable
    var contador=0
    contador = contador + 1
    
    println ("$nombre tiene $edad años")
    
    // Tipos de Datos
    val numero1: Byte = 127
    val numero2: Short = 32_767
    val numero3: Byte = 12
    val numero4: Long = 2_222_222_333_222_233
    
    println (numero1)
    println (numero2)
    println (numero3)
    println (numero4)
    
    // Números Decimales
    val numero5: Float =3.14f
    val numero6: Double = 3.14159265
    
    val booleno: Boolean = true
    
    //Caracteres
    val caracter: Char = 'k'
    val cadena: String = "Kotlin"
    val inferido = "string"
    println("Tipo de inferido: ${inferido::class.simpleName}")
    val inferido1=12
    println("Tipo de inferido: ${inferido1::class.simpleName}")
    
    // Utilidades de String
    // Expresiones
    val primerNombre = "Pedro"
    val primerApellido = "Perez"
    val primerNombreMayuscula=primerNombre.uppercase()
    val primerApellidoMayuscula=primerApellido.uppercase()
    
    println("Nombre completo: ${primerNombreMayuscula} ${primerApellidoMayuscula}")
    println("Nombre completo: ${primerNombre.uppercase()} ${primerApellido.uppercase()}")
    
    
}