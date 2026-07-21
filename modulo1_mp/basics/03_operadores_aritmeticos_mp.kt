fun main() {
    val precioBase = 8000
    val descuento = 500

    println("Suma: precioBase + impuesto = ${precioBase + (precioBase * 0.12)}")
    println("Resta: precioBase - descuento = ${precioBase - descuento}")
    println("Multiplicacion: precioBase * 2 unidades = ${precioBase * 2}")
    println("Division: precioBase / 2 cuotas = ${precioBase / 2}")
    println("Modulo: precioBase % 3 = ${precioBase % 3}")

    var total = 8000
    total += 960
    println("total+=impuesto $total")
    total -= 500
    println("total-=descuento $total")
    total *= 1
    println("total*=1 $total")
    total /= 2
    println("total/=2 cuotas $total")

    var contador = 0
    contador++
    println("Motos vendidas: $contador")
    contador--
    println("Devolucion: $contador")
}
