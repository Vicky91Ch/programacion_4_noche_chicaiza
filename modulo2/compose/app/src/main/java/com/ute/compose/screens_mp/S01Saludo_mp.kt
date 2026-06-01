package com.ute.compose.screens_mp

import androidx.compose.foundation.layout.*
import androidx.compose.material3.*
import androidx.compose.runtime.Composable
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.tooling.preview.Preview
import androidx.compose.ui.unit.dp

@Composable
fun SaludoMp(marca: String) {
    Text(text = "Bienvenido a $marca!")
}

@Composable
fun S01Saludo_mpScreen() {
    Column(
        modifier            = Modifier.fillMaxSize().padding(24.dp),
        verticalArrangement = Arrangement.spacedBy(16.dp),
        horizontalAlignment = Alignment.CenterHorizontally
    ) {
        Text("Sección 1 · @Composable básico - Motos",
            style = MaterialTheme.typography.titleMedium)
        HorizontalDivider()

        SaludoMp("Yamaha")
        SaludoMp("Honda")
        SaludoMp("Kawasaki")

        HorizontalDivider()

        MensajeCondicionalMp(mostrar = true)
        MensajeCondicionalMp(mostrar = false)
    }
}

@Composable
private fun MensajeCondicionalMp(mostrar: Boolean) {
    if (mostrar) {
        Text("✅ Moto disponible en stock")
    } else {
        Text("(Moto agotada temporalmente)",
            color = MaterialTheme.colorScheme.outline)
    }
}

@Preview(showBackground = true)
@Composable
fun S01MpPreview() {
    MaterialTheme { S01Saludo_mpScreen()}
}
