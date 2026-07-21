package com.ute.compose.screens_mp

import androidx.compose.foundation.background
import androidx.compose.foundation.border
import androidx.compose.foundation.clickable
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.shape.CircleShape
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.clip
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.tooling.preview.Preview
import androidx.compose.ui.unit.dp

@Composable
fun S05Modifier_mpScreen() {
    var ultimoClick by remember { mutableStateOf("Toca alguna moto") }

    Column(
        modifier            = Modifier.fillMaxSize().padding(16.dp),
        verticalArrangement = Arrangement.spacedBy(16.dp)
    ) {
        Text("Seccion 5 · Modifier - Fichas de Motos",
            style = MaterialTheme.typography.titleMedium)
        HorizontalDivider()

        Surface(
            color    = MaterialTheme.colorScheme.surfaceVariant,
            modifier = Modifier.fillMaxWidth()
        ) {
            Text(ultimoClick, Modifier.padding(12.dp),
                style = MaterialTheme.typography.bodySmall)
        }

        EtiquetaSeccionMp("1. clip ANTES de background (logo correcto)")
        Box(
            modifier = Modifier
                .size(130.dp)
                .clip(RoundedCornerShape(16.dp))
                .background(MaterialTheme.colorScheme.primaryContainer)
                .border(2.dp, MaterialTheme.colorScheme.primary, RoundedCornerShape(16.dp))
                .padding(12.dp)
                .clickable { ultimoClick = "Moto Yamaha seleccionada" },
            contentAlignment = Alignment.Center
        ) {
            Text("Yamaha\nMT-07\n✅",
                style = MaterialTheme.typography.labelSmall,
                color = MaterialTheme.colorScheme.onPrimaryContainer)
        }

        EtiquetaSeccionMp("2. background ANTES de clip (error comun)")
        Box(
            modifier = Modifier
                .size(130.dp)
                .background(Color(0xFFFFCDD2))
                .clip(RoundedCornerShape(16.dp))
                .padding(12.dp),
            contentAlignment = Alignment.Center
        ) {
            Text("Honda\nCB190R\n❌",
                style = MaterialTheme.typography.labelSmall)
        }

        EtiquetaSeccionMp("3. CircleShape + Marcas de motos")
        Row(horizontalArrangement = Arrangement.spacedBy(12.dp)) {
            listOf("Y" to Color(0xFF1976D2), "H" to Color(0xFF388E3C), "K" to Color(0xFFF57C00))
                .forEach { (letra, color) ->
                    Box(
                        modifier = Modifier
                            .size(56.dp)
                            .clip(CircleShape)
                            .background(color)
                            .clickable { ultimoClick = "Marca $letra seleccionada" },
                        contentAlignment = Alignment.Center
                    ) {
                        Text(letra, color = Color.White,
                            style = MaterialTheme.typography.titleMedium)
                    }
                }
        }

        EtiquetaSeccionMp("4. Precio destacado con padding asimetrico")
        Text(
            text     = "Oferta: \$6,800 USD - Kawasaki Ninja 400",
            modifier = Modifier
                .fillMaxWidth()
                .background(Color(0xFFE8F5E9))
                .padding(horizontal = 32.dp, vertical = 8.dp)
        )

        EtiquetaSeccionMp("5. Tamano fijo vs peso proporcional")
        Row(horizontalArrangement = Arrangement.spacedBy(8.dp)) {
            Box(Modifier.size(60.dp).background(Color(0xFFBBDEFB)),
                contentAlignment = Alignment.Center) { Text("Moto") }
            Box(Modifier.weight(1f).height(60.dp).background(Color(0xFFB3E5FC)),
                contentAlignment = Alignment.Center) { Text("Descripcion") }
        }
    }
}

@Preview(showBackground = true)
@Composable
fun S05MpPreview() {
    MaterialTheme { S05Modifier_mpScreen() }
}
