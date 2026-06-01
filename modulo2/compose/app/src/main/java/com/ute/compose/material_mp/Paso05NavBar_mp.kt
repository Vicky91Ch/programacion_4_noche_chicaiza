package com.ute.compose.material_mp

import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.items
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.*
import androidx.compose.material.icons.outlined.*
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.graphics.vector.ImageVector
import androidx.compose.ui.Modifier
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.tooling.preview.Preview
import androidx.compose.ui.unit.dp
import com.ute.compose.model_mp.Moto
import com.ute.compose.model_mp.motosDeMuestra

data class DestinoNavMp(
    val ruta: String,
    val etiqueta: String,
    val iconoActivo: ImageVector,
    val iconoInactivo: ImageVector
)

@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun Paso05NavBar_mpScreen() {
    var destinoActual by remember { mutableStateOf("catalogo") }
    var motos by remember { mutableStateOf(motosDeMuestra) }

    val destinos = listOf(
        DestinoNavMp("catalogo", "Catalogo", Icons.Filled.DirectionsBike, Icons.Outlined.DirectionsBike),
        DestinoNavMp("favoritas", "Favoritas", Icons.Filled.Favorite, Icons.Outlined.FavoriteBorder),
        DestinoNavMp("perfil", "Perfil", Icons.Filled.AccountCircle, Icons.Outlined.AccountCircle),
    )

    Scaffold(
        topBar = {
            TopAppBar(
                title = { Text("Venta de Motos", fontWeight = FontWeight.Bold) },
                colors = TopAppBarDefaults.topAppBarColors(
                    containerColor = MaterialTheme.colorScheme.primaryContainer,
                    titleContentColor = MaterialTheme.colorScheme.onPrimaryContainer
                )
            )
        },

        bottomBar = {
            NavigationBar {
                destinos.forEach { destino ->
                    val seleccionado = destinoActual == destino.ruta
                    NavigationBarItem(
                        selected = seleccionado,
                        onClick = { destinoActual = destino.ruta },
                        icon = {
                            Icon(
                                imageVector = if (seleccionado) destino.iconoActivo
                                else destino.iconoInactivo,
                                contentDescription = destino.etiqueta
                            )
                        },
                        label = { Text(destino.etiqueta) }
                    )
                }
            }
        },

        floatingActionButton = {
            if (destinoActual == "catalogo") {
                FloatingActionButton(onClick = { /* Paso 6 */ }) {
                    Icon(Icons.Default.Add, "Nueva moto")
                }
            }
        }

    ) { paddingValues ->
        when (destinoActual) {
            "catalogo" -> PantallaCatalogoContent(
                motos = motos,
                onFavorito = { id ->
                    motos = motos.map { m ->
                        if (m.id == id) m.copy(favorito = !m.favorito) else m
                    }
                },
                modifier = Modifier.padding(paddingValues)
            )
            "favoritas" -> PantallaFavoritasContent(
                favoritas = motos.filter { it.favorito },
                modifier = Modifier.padding(paddingValues)
            )
            "perfil" -> PantallaPerfilMpContent(
                modifier = Modifier.padding(paddingValues)
            )
        }
    }
}

@Composable
private fun PantallaCatalogoContent(
    motos: List<Moto>,
    onFavorito: (Int) -> Unit,
    modifier: Modifier = Modifier
) {
    LazyColumn(
        modifier = modifier,
        contentPadding = PaddingValues(16.dp),
        verticalArrangement = Arrangement.spacedBy(8.dp)
    ) {
        items(motos, key = { it.id }) { moto ->
            TarjetaMoto(
                moto = moto,
                onFavorito = { onFavorito(moto.id) }
            )
        }
        item { Spacer(Modifier.height(80.dp)) }
    }
}

@Composable
fun PantallaFavoritasContent(
    favoritas: List<Moto>,
    modifier: Modifier = Modifier
) {
    if (favoritas.isEmpty()) {
        Box(modifier.fillMaxSize(), contentAlignment = Alignment.Center) {
            Column(horizontalAlignment = Alignment.CenterHorizontally) {
                Icon(Icons.Default.FavoriteBorder, null,
                    Modifier.size(56.dp), tint = MaterialTheme.colorScheme.onSurfaceVariant)
                Spacer(Modifier.height(12.dp))
                Text("Sin favoritas aun",
                    style = MaterialTheme.typography.bodyLarge,
                    color = MaterialTheme.colorScheme.onSurfaceVariant)
                Text("Toca el corazon en una moto",
                    style = MaterialTheme.typography.bodySmall,
                    color = MaterialTheme.colorScheme.onSurfaceVariant)
            }
        }
    } else {
        LazyColumn(
            modifier = modifier,
            contentPadding = PaddingValues(16.dp),
            verticalArrangement = Arrangement.spacedBy(8.dp)
        ) {
            items(favoritas, key = { it.id }) { moto ->
                TarjetaMoto(moto = moto)
            }
        }
    }
}

@Composable
fun PantallaPerfilMpContent(modifier: Modifier = Modifier) {
    Box(modifier.fillMaxSize(), contentAlignment = Alignment.Center) {
        Column(horizontalAlignment = Alignment.CenterHorizontally) {
            Icon(Icons.Default.AccountCircle, null, Modifier.size(80.dp),
                tint = MaterialTheme.colorScheme.primary)
            Spacer(Modifier.height(12.dp))
            Text("Mi Perfil", style = MaterialTheme.typography.titleLarge,
                fontWeight = FontWeight.Bold)
            Text("Concesionario de Motos",
                style = MaterialTheme.typography.bodyMedium,
                color = MaterialTheme.colorScheme.onSurfaceVariant)
        }
    }
}

@Preview(showBackground = true)
@Composable
fun Paso05NavBarMpPreview() {
    MaterialTheme { Paso05NavBar_mpScreen() }
}
