package com.ute.compose.screens_mp

import androidx.compose.foundation.background
import androidx.compose.foundation.layout.*
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
fun S07StateHoisting_mpScreen() {
    Column(
        modifier            = Modifier.fillMaxSize().padding(16.dp),
        verticalArrangement = Arrangement.spacedBy(20.dp)
    ) {
        Text("Seccion 7 · State Hoisting - Catalogo Motos",
            style = MaterialTheme.typography.titleMedium)
        HorizontalDivider()

        DemoEstadoAtrapadoMp()
        HorizontalDivider()
        DemoEstadoElevadoMp()
    }
}

@Composable
private fun DemoEstadoAtrapadoMp() {
    Column(verticalArrangement = Arrangement.spacedBy(8.dp)) {
        EtiquetaSeccionMp("Estado atrapado - el padre no puede leerlo")

        Text(
            "El estado vive dentro del boton. El padre no sabe cuantas veces " +
                    "se selecciono ni puede usarlo.",
            style = MaterialTheme.typography.bodySmall,
            color = MaterialTheme.colorScheme.onSurfaceVariant
        )

        BotonAtrapadoMp()

        Text(
            "El padre no puede mostrar la seleccion aqui",
            style = MaterialTheme.typography.bodySmall,
            color = MaterialTheme.colorScheme.error
        )
    }
}

@Composable
private fun BotonAtrapadoMp() {
    var cuenta by remember { mutableStateOf(0) }
    Button(onClick = { cuenta++ }) {
        Text("Moto seleccionada $cuenta veces (estado atrapado)")
    }
}

@Composable
private fun DemoEstadoElevadoMp() {
    var seleccion by remember { mutableStateOf<String?>(null) }
    var historial by remember { mutableStateOf(listOf<String>()) }

    val opciones = listOf("Yamaha MT-07", "Honda CB190R", "Kawasaki Ninja 400", "Suzuki V-Strom 650")

    Column(verticalArrangement = Arrangement.spacedBy(8.dp)) {
        EtiquetaSeccionMp("Estado elevado - el padre coordina todo")

        Text(
            "El hijo solo notifica que moto fue seleccionada. " +
                    "El padre actualiza la seleccion Y el historial.",
            style = MaterialTheme.typography.bodySmall,
            color = MaterialTheme.colorScheme.onSurfaceVariant
        )

        SelectorMotosMp(
            opciones   = opciones,
            seleccion  = seleccion,
            onSeleccion = { opcion ->
                seleccion = opcion
                historial = (historial + opcion).takeLast(4)
            }
        )

        seleccion?.let { sel ->
            val color = when {
                "Yamaha"     in sel -> Color(0xFFFFCDD2)
                "Honda"    in sel -> Color(0xFFC8E6C9)
                "Kawasaki"     in sel -> Color(0xFFBBDEFB)
                "Suzuki" in sel -> Color(0xFFFFF9C4)
                else              -> Color.Transparent
            }
            Box(
                modifier = Modifier
                    .fillMaxWidth()
                    .height(48.dp)
                    .clip(RoundedCornerShape(8.dp))
                    .background(color),
                contentAlignment = Alignment.Center
            ) {
                Text("Seleccionado: $sel",
                    style = MaterialTheme.typography.labelLarge)
            }
        }

        if (historial.isNotEmpty()) {
            Text(
                "Historial: ${historial.joinToString(" -> ")}",
                style = MaterialTheme.typography.bodySmall,
                color = MaterialTheme.colorScheme.onSurfaceVariant
            )
        }
    }
}

@Composable
private fun SelectorMotosMp(
    opciones:    List<String>,
    seleccion:   String?,
    onSeleccion: (String) -> Unit
) {
    Column(verticalArrangement = Arrangement.spacedBy(4.dp)) {
        opciones.forEach { opcion ->
            val estaSeleccionado = seleccion == opcion
            Button(
                onClick  = { onSeleccion(opcion) },
                modifier = Modifier.fillMaxWidth(),
                colors   = if (estaSeleccionado)
                    ButtonDefaults.buttonColors()
                else
                    ButtonDefaults.outlinedButtonColors()
            ) {
                Text(opcion)
            }
        }
    }
}

@Preview(showBackground = true)
@Composable
fun S07MpPreview() {
    MaterialTheme { S07StateHoisting_mpScreen() }
}
