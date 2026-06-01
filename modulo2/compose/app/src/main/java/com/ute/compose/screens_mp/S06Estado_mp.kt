package com.ute.compose.screens_mp

import androidx.compose.foundation.layout.*
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.clip
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.tooling.preview.Preview
import androidx.compose.ui.unit.dp

@Composable
fun S06Estado_mpScreen() {
    Column(
        modifier            = Modifier.fillMaxSize().padding(16.dp),
        verticalArrangement = Arrangement.spacedBy(24.dp)
    ) {
        Text("Seccion 6 · Estado y recomposicion - Inventario Motos",
            style = MaterialTheme.typography.titleMedium)
        HorizontalDivider()

        DemoContadorStockMp()
        HorizontalDivider()
        DemoEstadoDerivadoMp()
    }
}

@Composable
private fun DemoContadorStockMp() {
    var stock by remember { mutableStateOf(5) }

    Column(
        horizontalAlignment = Alignment.CenterHorizontally,
        verticalArrangement = Arrangement.spacedBy(8.dp)
    ) {
        EtiquetaSeccionMp("Stock de motos - remember + mutableStateOf")

        Text(
            text       = "$stock",
            style      = MaterialTheme.typography.displayMedium,
            fontWeight = FontWeight.Bold
        )

        Row(horizontalArrangement = Arrangement.spacedBy(8.dp)) {
            Button(onClick = { stock-- }) { Text("Vender") }
            Button(onClick = { stock++ }) { Text("Reponer") }
            OutlinedButton(onClick = { stock = 5 }) { Text("Reset") }
        }

        Text(
            "Solo el numero se recompone al hacer click",
            style = MaterialTheme.typography.bodySmall,
            color = MaterialTheme.colorScheme.onSurfaceVariant
        )
    }
}

@Composable
private fun DemoEstadoDerivadoMp() {
    var nivel by remember { mutableStateOf(0) }
    val max = 5

    val porcentaje = nivel.toFloat() / max
    val etiquetaNivel = when {
        nivel == 0    -> "Sin existencias"
        nivel <= 2    -> "Stock bajo"
        nivel <= 4    -> "Stock medio"
        else          -> "Stock completo"
    }

    Column(verticalArrangement = Arrangement.spacedBy(8.dp)) {
        EtiquetaSeccionMp("Estado derivado - Nivel de stock")

        Text(
            "$etiquetaNivel (nivel $nivel/$max)",
            style      = MaterialTheme.typography.titleMedium,
            fontWeight = FontWeight.SemiBold
        )

        LinearProgressIndicator(
            progress = { porcentaje },
            modifier = Modifier
                .fillMaxWidth()
                .height(12.dp)
                .clip(RoundedCornerShape(6.dp))
        )

        Row(horizontalArrangement = Arrangement.spacedBy(8.dp)) {
            OutlinedButton(
                onClick  = { if (nivel > 0) nivel-- },
                enabled  = nivel > 0
            ) { Text("Bajar stock") }

            Button(
                onClick  = { if (nivel < max) nivel++ },
                enabled  = nivel < max
            ) { Text("Subir stock") }
        }

        Text(
            "porcentaje = ${"%.0f".format(porcentaje * 100)}% " +
                    "derivado de nivel, sin estado propio",
            style = MaterialTheme.typography.bodySmall,
            color = MaterialTheme.colorScheme.onSurfaceVariant
        )
    }
}

@Preview(showBackground = true)
@Composable
fun S06MpPreview() {
    MaterialTheme { S06Estado_mpScreen() }
}
