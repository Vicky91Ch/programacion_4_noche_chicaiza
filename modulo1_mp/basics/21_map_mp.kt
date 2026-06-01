fun main() {
    println("Map - Venta de Motos")
    println("Inmutables")
    val preciosMotos = mapOf(
        "Yamaha MT-07" to 7500.0,
        "Honda CB190R" to 4200.0,
        "Suzuki V-Strom" to 8900.0,
        "Kawasaki Ninja 400" to 6800.0
    )
    println(preciosMotos["Yamaha MT-07"])
    println(preciosMotos["BMW"])
    println(preciosMotos.getOrDefault("Yamaha MT-07", 0.0))
    println(preciosMotos.getOrDefault("BMW", 0.0))
    println(preciosMotos.keys)
    println(preciosMotos.values)
    println(preciosMotos)
    for ((moto, precio) in preciosMotos) {
        println("moto: $moto - precio: $$precio")
    }
    for (moto in preciosMotos) {
        println("moto: $moto")
    }

    println("Mutables")
    val inventario = mutableMapOf(
        "MT-07" to 5,
        "CB190R" to 8,
        "V-Strom" to 3,
        "Ninja 400" to 6
    )
    inventario["Pulsar"] = 10
    println(inventario)
    inventario["MT-07"] = 7
    println(inventario)
    inventario.remove("CB190R")
    println(inventario)
    inventario.getOrPut("Dominar") { 4 }
    println(inventario)
    inventario.getOrPut("V-Strom") { 4 }
    println(inventario)
}
