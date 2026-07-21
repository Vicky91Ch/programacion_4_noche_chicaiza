package com.ute.compose.screens_mp

import androidx.compose.foundation.layout.*
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.Add
import androidx.compose.material.icons.filled.Delete
import androidx.compose.material.icons.filled.Favorite
import androidx.compose.material.icons.filled.ShoppingCart
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.tooling.preview.Preview
import androidx.compose.ui.unit.dp

@Composable
fun S03Button_mpScreen() {
    var ultimoClick by remember { mutableStateOf("(ninguna accion)") }

    Column(
        modifier            = Modifier.fillMaxSize().padding(24.dp),
        verticalArrangement = Arrangement.spacedBy(10.dp),
        horizontalAlignment = Alignment.CenterHorizontally
    ) {
        Text("Seccion 3 · Variantes de Button - Motos",
            style = MaterialTheme.typography.titleMedium)
        HorizontalDivider()

        Surface(
            color    = MaterialTheme.colorScheme.surfaceVariant,
            modifier = Modifier.fillMaxWidth()
        ) {
            Text(
                text     = "Ultima accion: $ultimoClick",
                modifier = Modifier.padding(12.dp),
                style    = MaterialTheme.typography.bodyMedium
            )
        }

        Spacer(Modifier.height(4.dp))

        Button(
            onClick  = { ultimoClick = "Comprar moto" },
            modifier = Modifier.fillMaxWidth()
        ) { Text("Comprar moto") }

        Button(
            onClick  = { ultimoClick = "Agregar al carrito" },
            modifier = Modifier.fillMaxWidth()
        ) {
            Icon(
                imageVector        = Icons.Default.ShoppingCart,
                contentDescription = null,
                modifier           = Modifier.size(18.dp)
            )
            Spacer(Modifier.width(8.dp))
            Text("Agregar al carrito")
        }

        OutlinedButton(
            onClick  = { ultimoClick = "Ver detalles" },
            modifier = Modifier.fillMaxWidth()
        ) { Text("Ver detalles") }

        TextButton(
            onClick  = { ultimoClick = "Ver catalogo" },
            modifier = Modifier.fillMaxWidth()
        ) { Text("Ver catalogo") }

        ElevatedButton(
            onClick  = { ultimoClick = "Solicitar prueba" },
            modifier = Modifier.fillMaxWidth()
        ) { Text("Solicitar prueba de manejo") }

        FilledTonalButton(
            onClick  = { ultimoClick = "Agregar a favoritos" },
            modifier = Modifier.fillMaxWidth()
        ) { Text("Agregar a favoritos") }

        Button(
            onClick  = { },
            enabled  = false,
            modifier = Modifier.fillMaxWidth()
        ) { Text("Moto agotada (enabled = false)") }

        HorizontalDivider()

        EtiquetaSeccionMp("IconButton - Acciones rapidas")
        Row(horizontalArrangement = Arrangement.spacedBy(8.dp)) {
            IconButton(onClick = { ultimoClick = "Favorito" }) {
                Icon(Icons.Default.Favorite, contentDescription = "Favorito")
            }
            IconButton(onClick = { ultimoClick = "Agregar" }) {
                Icon(Icons.Default.Add, contentDescription = "Agregar")
            }
            IconButton(onClick = { ultimoClick = "Eliminar" }) {
                Icon(Icons.Default.Delete, contentDescription = "Eliminar",
                    tint = MaterialTheme.colorScheme.error)
            }
        }
    }
}

@Preview(showBackground = true)
@Composable
fun S03MpPreview() {
    MaterialTheme { S03Button_mpScreen() }
}
