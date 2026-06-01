package com.ute.compose.screens_mp

import androidx.compose.foundation.background
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.rememberScrollState
import androidx.compose.foundation.verticalScroll
import androidx.compose.material3.*
import androidx.compose.runtime.Composable
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.tooling.preview.Preview
import androidx.compose.ui.unit.dp

@Composable
fun S04Layout_mpScreen() {
    Column(
        modifier = Modifier
            .fillMaxSize()
            .padding(16.dp)
            .verticalScroll(rememberScrollState()),
        verticalArrangement = Arrangement.spacedBy(20.dp)
    ) {
        Text("Seccion 4 · Column · Row · Box - Catalogo Motos",
            style = MaterialTheme.typography.titleMedium)
        HorizontalDivider()

        EtiquetaSeccionMp("Column — Marcas de motos")
        Column(
            modifier            = Modifier
                .fillMaxWidth()
                .background(Color(0xFFE3F2FD))
                .padding(12.dp),
            verticalArrangement = Arrangement.spacedBy(4.dp),
            horizontalAlignment = Alignment.CenterHorizontally
        ) {
            CeldaLayoutMp("Yamaha", Color(0xFF90CAF9))
            CeldaLayoutMp("Honda", Color(0xFF64B5F6))
            CeldaLayoutMp("Kawasaki", Color(0xFF42A5F5))
        }

        EtiquetaSeccionMp("Row — Categorias SpaceBetween")
        Row(
            modifier              = Modifier
                .fillMaxWidth()
                .background(Color(0xFFF3E5F5))
                .padding(12.dp),
            horizontalArrangement = Arrangement.SpaceBetween,
            verticalAlignment     = Alignment.CenterVertically
        ) {
            Text("Deportivas")
            Text("Touring")
            Text("Naked")
        }

        EtiquetaSeccionMp("Row — Precios SpaceEvenly")
        Row(
            modifier              = Modifier
                .fillMaxWidth()
                .background(Color(0xFFE8F5E9))
                .padding(12.dp),
            horizontalArrangement = Arrangement.SpaceEvenly
        ) {
            Text("\$3500"); Text("\$5500"); Text("\$7500"); Text("\$8900")
        }

        EtiquetaSeccionMp("Row + weight (proporcion cilindraje 1:2:1)")
        Row(Modifier.fillMaxWidth().height(50.dp)) {
            Box(Modifier.weight(1f).fillMaxHeight().background(Color(0xFFEF9A9A)),
                contentAlignment = Alignment.Center) { Text("199cc") }
            Box(Modifier.weight(2f).fillMaxHeight().background(Color(0xFFE57373)),
                contentAlignment = Alignment.Center) { Text("399cc") }
            Box(Modifier.weight(1f).fillMaxHeight().background(Color(0xFFEF5350)),
                contentAlignment = Alignment.Center) { Text("689cc") }
        }

        EtiquetaSeccionMp("Box — Ficha de moto superpuesta")
        Box(
            modifier         = Modifier
                .fillMaxWidth()
                .height(120.dp)
                .background(Color(0xFF1565C0)),
            contentAlignment = Alignment.Center
        ) {
            Box(Modifier.size(40.dp).background(Color(0xFF42A5F5))
                .align(Alignment.TopStart))
            Box(Modifier.size(40.dp).background(Color(0xFF1976D2))
                .align(Alignment.BottomEnd))
            Text("Moto destacada del mes",
                color = Color.White,
                style = MaterialTheme.typography.labelLarge)
        }
    }
}

@Composable
private fun CeldaLayoutMp(label: String, color: Color) {
    Box(
        modifier         = Modifier.fillMaxWidth().height(36.dp).background(color),
        contentAlignment = Alignment.Center
    ) { Text(label, style = MaterialTheme.typography.labelMedium) }
}

@Preview(showBackground = true)
@Composable
fun S04MpPreview() {
    MaterialTheme { S04Layout_mpScreen() }
}
