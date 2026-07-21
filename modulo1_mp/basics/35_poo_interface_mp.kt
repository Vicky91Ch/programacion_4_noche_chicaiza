interface A {
    fun saludar() {
        println("Hola desde Venta de Motos A")
    }
}

interface B {
    fun saludar() {
        println("Hola desde Venta de Motos B")
    }
}

class C : A, B {
    override fun saludar() {
        super<A>.saludar()
        super<B>.saludar()
        println("Y desde el concesionario")
    }
}

fun main() {
    val objeto = C()
    objeto.saludar()
}