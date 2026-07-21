package com.ute.compose.screens_mp

import androidx.compose.foundation.layout.*
import androidx.compose.material3.*
import androidx.compose.runtime.Composable
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.text.font.FontStyle
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.style.TextAlign
import androidx.compose.ui.text.style.TextDecoration
import androidx.compose.ui.text.style.TextOverflow
import androidx.compose.ui.tooling.preview.Preview
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp

@Composable
fun S02Text_mpScreen() {
    Column(
        modifier            = Modifier.fillMaxSize().padding(24.dp),
        verticalArrangement = Arrangement.spacedBy(12.dp)
    ) {
        Text("Sección 2 · Text con estilos - Motos",
            style = MaterialTheme.typography.titleMedium)
        HorizontalDivider()

        EtiquetaSeccionMp("1. Marcas de motos")
        Text("Yamaha MT-07 - 7500 USD")

        EtiquetaSeccionMp("2. fontSize + fontWeight + fontStyle")
        Text("Honda 24sp",   fontSize = 24.sp, fontWeight = FontWeight.Bold)
        Text("Kawasaki 18sp",   fontSize = 18.sp, fontStyle  = FontStyle.Italic)
        Text("Suzuki 20sp",     fontSize = 20.sp, fontWeight = FontWeight.Light)

        EtiquetaSeccionMp("3. Color de motos disponibles")
        Text("Moto en stock",
            color = Color(0xFF1976D2))
        Text("Oferta especial",
            textDecoration = TextDecoration.Underline)
        Text("Agotado",
            textDecoration = TextDecoration.LineThrough,
            color          = MaterialTheme.colorScheme.onSurfaceVariant)

        EtiquetaSeccionMp("4. Catálogo limitado - overflow")
        Text(
            text     = "Esta moto tiene un precio especial con descuento por temporada de verano 2026",
            maxLines = 1,
            overflow = TextOverflow.Ellipsis
        )
        Text(
            text     = "Modelo deportivo ideal para carretera con motor de alta cilindrada y diseño aerodinámico",
            maxLines = 2,
            overflow = TextOverflow.Ellipsis
        )

        EtiquetaSeccionMp("5. Escala tipográfica Material 3")
        Text("Moto destacada", style = MaterialTheme.typography.headlineMedium)
        Text("Catálogo",     style = MaterialTheme.typography.titleLarge)
        Text("Precio: 7500 USD",      style = MaterialTheme.typography.bodyLarge)
        Text("Cilindraje: 689cc",      style = MaterialTheme.typography.bodySmall)
        Text("Stock: 3",     style = MaterialTheme.typography.labelSmall)

        EtiquetaSeccionMp("6. Alineación de precios")
        Text(
            text      = "Precio centrado: \$7,500 USD",
            textAlign = TextAlign.Center,
            modifier  = Modifier.fillMaxWidth()
        )
        Text(
            text      = "Total a pagar: \$8,250 USD",
            textAlign = TextAlign.End,
            modifier  = Modifier.fillMaxWidth()
        )
    }
}

@Composable
internal fun EtiquetaSeccionMp(texto: String) {
    Text(
        text  = texto,
        style = MaterialTheme.typography.labelMedium,
        color = MaterialTheme.colorScheme.primary
    )
}

@Preview(showBackground = true)
@Composable
fun S02MpPreview() {
    MaterialTheme { S02Text_mpScreen() }
}
