package com.ute.compose.material_mp

import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.LazyRow
import androidx.compose.foundation.lazy.items
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.*
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.tooling.preview.Preview
import androidx.compose.ui.unit.dp
import com.ute.compose.model_mp.Moto
import com.ute.compose.model_mp.motosDeMuestra

@Composable
fun Paso03LazyColumn_mpScreen() {
    var motos by remember { mutableStateOf(motosDeMuestra) }
    var busqueda by remember { mutableStateOf("") }
    var filtro by remember { mutableStateOf("Todas") }

    val motosFiltradas = motos
        .filter { m ->
            when (filtro) {
                "Favoritas" -> m.favorito
                else -> true
            }
        }
        .filter { m ->
            busqueda.isBlank() ||
                    m.marca.contains(busqueda, ignoreCase = true) ||
                    m.modelo.contains(busqueda, ignoreCase = true)
        }

    Column(modifier = Modifier.fillMaxSize()) {
        Text(
            "Paso 3 · LazyColumn - Catalogo Motos",
            style = MaterialTheme.typography.titleMedium,
            modifier = Modifier.padding(16.dp)
        )

        OutlinedTextField(
            value = busqueda,
            onValueChange = { busqueda = it },
            placeholder = { Text("Buscar...") },
            leadingIcon = { Icon(Icons.Default.Search, contentDescription = null) },
            trailingIcon = {
                if (busqueda.isNotEmpty())
                    IconButton(onClick = { busqueda = "" }) {
                        Icon(Icons.Default.Clear, contentDescription = "Limpiar")
                    }
            },
            singleLine = true,
            modifier = Modifier.fillMaxWidth().padding(horizontal = 16.dp)
        )

        Spacer(Modifier.height(8.dp))

        LazyRow(
            horizontalArrangement = Arrangement.spacedBy(8.dp),
            contentPadding = PaddingValues(horizontal = 16.dp)
        ) {
            items(listOf("Todas", "Favoritas")) { opcion ->
                FilterChip(
                    selected = filtro == opcion,
                    onClick = { filtro = opcion },
                    label = { Text(opcion) },
                    leadingIcon = if (filtro == opcion) {{
                        Icon(Icons.Default.Check,
                            contentDescription = null,
                            modifier = Modifier.size(FilterChipDefaults.IconSize))
                    }} else null
                )
            }
        }

        Spacer(Modifier.height(8.dp))

        if (motosFiltradas.isEmpty()) {
            Box(
                modifier = Modifier.fillMaxSize(),
                contentAlignment = Alignment.Center
            ) {
                Column(horizontalAlignment = Alignment.CenterHorizontally) {
                    Icon(
                        Icons.Default.SearchOff,
                        contentDescription = null,
                        modifier = Modifier.size(56.dp),
                        tint = MaterialTheme.colorScheme.onSurfaceVariant
                    )
                    Spacer(Modifier.height(12.dp))
                    Text("Sin resultados",
                        style = MaterialTheme.typography.bodyLarge,
                        color = MaterialTheme.colorScheme.onSurfaceVariant)
                }
            }
        } else {
            LazyColumn(
                contentPadding = PaddingValues(horizontal = 16.dp, vertical = 8.dp),
                verticalArrangement = Arrangement.spacedBy(8.dp)
            ) {
                item {
                    Text(
                        "${motosFiltradas.size} moto(s)",
                        style = MaterialTheme.typography.labelSmall,
                        color = MaterialTheme.colorScheme.onSurfaceVariant,
                        modifier = Modifier.padding(bottom = 4.dp)
                    )
                }

                items(
                    items = motosFiltradas,
                    key = { it.id }
                ) { moto ->
                    TarjetaMoto(
                        moto = moto,
                        onLlamar = { /* Paso 6: snackbar */ },
                        onFavorito = {
                            motos = motos.map { m ->
                                if (m.id == moto.id) m.copy(favorito = !m.favorito)
                                else m
                            }
                        }
                    )
                }

                item { Spacer(Modifier.height(16.dp)) }
            }
        }
    }
}

@Preview(showBackground = true)
@Composable
fun Paso03LazyColumnMpPreview() {
    MaterialTheme { Paso03LazyColumn_mpScreen() }
}
