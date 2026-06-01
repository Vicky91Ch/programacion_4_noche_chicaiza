package com.ute.compose.model_mp

data class Moto(
    val id: Int,
    val marca: String,
    val modelo: String,
    val precio: Double,
    val cilindraje: Int,
    val imagenUrl: String = "",
    val favorito: Boolean = false
)

val motosDeMuestra = listOf(
    Moto(1, "Yamaha", "MT-07", 7500.0, 689, favorito = true),
    Moto(2, "Honda", "CB190R", 4200.0, 184),
    Moto(3, "Kawasaki", "Ninja 400", 6800.0, 399, favorito = true),
    Moto(4, "Suzuki", "V-Strom 650", 8900.0, 645),
    Moto(5, "KTM", "Duke 390", 6200.0, 373),
    Moto(6, "Bajaj", "Pulsar NS200", 3500.0, 199),
    Moto(7, "BMW", "G 310 R", 5500.0, 313, favorito = true),
    Moto(8, "CFMoto", "400NK", 4800.0, 400),
)
