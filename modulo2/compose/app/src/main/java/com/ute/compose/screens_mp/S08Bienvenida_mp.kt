package com.ute.compose.screens_mp

import androidx.compose.foundation.background
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.shape.CircleShape
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
fun S08Bienvenida_mpScreen() {
    var paso by remember { mutableStateOf(1) }

    Column(
        modifier            = Modifier.fillMaxSize().padding(24.dp),
        verticalArrangement = Arrangement.Center,
        horizontalAlignment = Alignment.CenterHorizontally
    ) {
        when (paso) {
            1 -> PasoUnoMp(onSiguiente = { paso = 2 })
            2 -> PasoDosMp(onSiguiente = { paso = 3 }, onVolver = { paso = 1 })
            3 -> PasoTresMp(onReiniciar = { paso = 1 })
        }
    }
}

@Composable
private fun PasoUnoMp(onSiguiente: () -> Unit) {
    var marcaElegida by remember { mutableStateOf<String?>(null) }

    Column(
        horizontalAlignment = Alignment.CenterHorizontally,
        verticalArrangement = Arrangement.spacedBy(16.dp)
    ) {
        IndicadorPasosMp(pasoActual = 1, totalPasos = 3)

        Spacer(Modifier.height(8.dp))

        Text("Elige una marca de moto",
            style      = MaterialTheme.typography.headlineSmall,
            fontWeight = FontWeight.Bold)
        Text("Selecciona la marca que mas te guste",
            style = MaterialTheme.typography.bodyMedium,
            color = MaterialTheme.colorScheme.onSurfaceVariant)

        Spacer(Modifier.height(8.dp))

        listOf("Yamaha", "Honda", "Kawasaki").forEach { marca ->
            val seleccionado = marcaElegida == marca
            Button(
                onClick  = { marcaElegida = marca },
                modifier = Modifier.fillMaxWidth(),
                colors   = if (seleccionado) ButtonDefaults.buttonColors()
                else ButtonDefaults.outlinedButtonColors()
            ) {
                Text(marca)
                if (seleccionado) {
                    Spacer(Modifier.width(8.dp))
                    Text("✓")
                }
            }
        }

        Spacer(Modifier.height(8.dp))

        Button(
            onClick  = onSiguiente,
            enabled  = marcaElegida != null,
            modifier = Modifier.fillMaxWidth().height(50.dp),
            shape    = RoundedCornerShape(12.dp)
        ) {
            Text("Siguiente ->")
        }
    }
}

@Composable
private fun PasoDosMp(onSiguiente: () -> Unit, onVolver: () -> Unit) {
    var cilindraje by remember { mutableStateOf(1) }
    val max = 5

    val descripcion = when (cilindraje) {
        1    -> "125cc - Urbana"
        2    -> "200cc - Liviana"
        3    -> "400cc - Intermedia"
        4    -> "650cc - Potente"
        else -> "1000cc - Super deportiva"
    }

    Column(
        horizontalAlignment = Alignment.CenterHorizontally,
        verticalArrangement = Arrangement.spacedBy(16.dp)
    ) {
        IndicadorPasosMp(pasoActual = 2, totalPasos = 3)

        Spacer(Modifier.height(8.dp))

        Text("Cilindraje preferido",
            style      = MaterialTheme.typography.headlineSmall,
            fontWeight = FontWeight.Bold)

        Text(
            "Nivel $cilindraje de $max",
            style      = MaterialTheme.typography.displaySmall,
            fontWeight = FontWeight.Bold,
            color      = MaterialTheme.colorScheme.primary
        )

        Text(descripcion,
            style = MaterialTheme.typography.bodyLarge,
            color = MaterialTheme.colorScheme.onSurfaceVariant)

        LinearProgressIndicator(
            progress = { cilindraje.toFloat() / max },
            modifier = Modifier.fillMaxWidth().height(8.dp)
                .clip(RoundedCornerShape(4.dp))
        )

        Row(horizontalArrangement = Arrangement.spacedBy(8.dp)) {
            OutlinedButton(
                onClick  = { if (cilindraje > 1) cilindraje-- },
                enabled  = cilindraje > 1
            ) { Text("-") }
            Button(
                onClick  = { if (cilindraje < max) cilindraje++ },
                enabled  = cilindraje < max
            ) { Text("+") }
        }

        Spacer(Modifier.height(8.dp))

        Row(
            modifier              = Modifier.fillMaxWidth(),
            horizontalArrangement = Arrangement.spacedBy(8.dp)
        ) {
            OutlinedButton(onClick = onVolver, modifier = Modifier.weight(1f)) {
                Text("<- Volver")
            }
            Button(onClick = onSiguiente, modifier = Modifier.weight(1f),
                shape = RoundedCornerShape(12.dp)) {
                Text("Siguiente ->")
            }
        }
    }
}

@Composable
private fun PasoTresMp(onReiniciar: () -> Unit) {
    Column(
        horizontalAlignment = Alignment.CenterHorizontally,
        verticalArrangement = Arrangement.spacedBy(16.dp)
    ) {
        IndicadorPasosMp(pasoActual = 3, totalPasos = 3)

        Spacer(Modifier.height(8.dp))

        Box(
            modifier         = Modifier
                .size(88.dp)
                .clip(CircleShape)
                .background(MaterialTheme.colorScheme.primaryContainer),
            contentAlignment = Alignment.Center
        ) {
            Text("✓",
                style      = MaterialTheme.typography.displaySmall,
                fontWeight = FontWeight.Bold,
                color      = MaterialTheme.colorScheme.onPrimaryContainer)
        }

        Text("¡Preferencias guardadas!",
            style      = MaterialTheme.typography.headlineSmall,
            fontWeight = FontWeight.Bold)

        Text(
            "Has configurado tu busqueda de moto ideal.\n" +
                    "Marca y cilindraje preferidos listos.",
            style     = MaterialTheme.typography.bodyMedium,
            color     = MaterialTheme.colorScheme.onSurfaceVariant
        )

        Spacer(Modifier.height(8.dp))

        OutlinedButton(
            onClick  = onReiniciar,
            modifier = Modifier.fillMaxWidth()
        ) {
            Text("Empezar de nuevo")
        }
    }
}

@Composable
private fun IndicadorPasosMp(pasoActual: Int, totalPasos: Int) {
    Row(horizontalArrangement = Arrangement.spacedBy(8.dp)) {
        (1..totalPasos).forEach { paso ->
            Box(
                modifier = Modifier
                    .size(if (paso == pasoActual) 12.dp else 8.dp)
                    .clip(CircleShape)
                    .background(
                        if (paso <= pasoActual) MaterialTheme.colorScheme.primary
                        else MaterialTheme.colorScheme.surfaceVariant
                    )
            )
        }
    }
}

@Preview(showBackground = true)
@Composable
fun S08MpPreview() {
    MaterialTheme { S08Bienvenida_mpScreen() }
}
