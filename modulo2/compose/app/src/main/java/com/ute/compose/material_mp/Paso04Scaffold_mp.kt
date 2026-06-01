package com.ute.compose.material_mp

import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.LazyRow
import androidx.compose.foundation.lazy.items
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.*
import androidx.compose.material3.*
import androidx.compose.material3.TopAppBarDefaults.topAppBarColors
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.tooling.preview.Preview
import androidx.compose.ui.unit.dp
import com.ute.compose.model_mp.motosDeMuestra

@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun Paso04Scaffold_mpScreen() {
    var motos by remember { mutableStateOf(motosDeMuestra) }
    var busqueda by remember { mutableStateOf("") }
    var filtro by remember { mutableStateOf("Todas") }
    var mostrarFab by remember { mutableStateOf(false) }

    val motosFiltradas = motos
        .filter { m -> if (filtro == "Favoritas") m.favorito else true }
        .filter { m ->
            busqueda.isBlank() ||
                    m.marca.contains(busqueda, ignoreCase = true)
        }

    Scaffold(
        topBar = {
            TopAppBar(
                title = {
                    Text(
                        "Motos (${motos.size})",
                        fontWeight = FontWeight.Bold
                    )
                },
                actions = {
                    IconButton(onClick = {
                        filtro = if (filtro == "Favoritas") "Todas" else "Favoritas"
                    }) {
                        Icon(
                            imageVector = if (filtro == "Favoritas")
                                Icons.Default.Favorite else Icons.Default.FavoriteBorder,
                            contentDescription = "Filtrar favoritas",
                            tint = if (filtro == "Favoritas")
                                MaterialTheme.colorScheme.error
                            else
                                MaterialTheme.colorScheme.onSurface
                        )
                    }
                },
                colors = topAppBarColors(
                    containerColor = MaterialTheme.colorScheme.primaryContainer,
                    titleContentColor = MaterialTheme.colorScheme.onPrimaryContainer
                )
            )
        },

        floatingActionButton = {
            FloatingActionButton(
                onClick = { mostrarFab = true }
            ) {
                Icon(Icons.Default.Add, contentDescription = "Nueva moto")
            }
        }

    ) { paddingValues ->
        Column(
            modifier = Modifier
                .padding(paddingValues)
                .fillMaxSize()
        ) {
            OutlinedTextField(
                value = busqueda,
                onValueChange = { busqueda = it },
                placeholder = { Text("Buscar moto...") },
                leadingIcon = { Icon(Icons.Default.Search, null) },
                trailingIcon = {
                    if (busqueda.isNotEmpty())
                        IconButton(onClick = { busqueda = "" }) {
                            Icon(Icons.Default.Clear, "Limpiar")
                        }
                },
                singleLine = true,
                modifier = Modifier
                    .fillMaxWidth()
                    .padding(horizontal = 16.dp, vertical = 8.dp)
            )

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
                            Icon(Icons.Default.Check, null,
                                Modifier.size(FilterChipDefaults.IconSize))
                        }} else null
                    )
                }
            }

            Spacer(Modifier.height(4.dp))

            LazyColumn(
                contentPadding = PaddingValues(horizontal = 16.dp, vertical = 8.dp),
                verticalArrangement = Arrangement.spacedBy(8.dp)
            ) {
                item {
                    Text("${motosFiltradas.size} resultado(s)",
                        style = MaterialTheme.typography.labelSmall,
                        color = MaterialTheme.colorScheme.onSurfaceVariant,
                        modifier = Modifier.padding(bottom = 4.dp))
                }
                items(motosFiltradas, key = { it.id }) { moto ->
                    TarjetaMoto(
                        moto = moto,
                        onFavorito = {
                            motos = motos.map { m ->
                                if (m.id == moto.id) m.copy(favorito = !m.favorito) else m
                            }
                        }
                    )
                }
                item { Spacer(Modifier.height(80.dp)) }
            }
        }
    }

    if (mostrarFab) {
        AlertDialog(
            onDismissRequest = { mostrarFab = false },
            title = { Text("Nueva moto") },
            text = { Text("Funcion conectada con formulario del Paso 1.") },
            confirmButton = {
                TextButton(onClick = { mostrarFab = false }) { Text("OK") }
            }
        )
    }
}

@Preview(showBackground = true)
@Composable
fun Paso04ScaffoldMpPreview() {
    MaterialTheme { Paso04Scaffold_mpScreen() }
}
