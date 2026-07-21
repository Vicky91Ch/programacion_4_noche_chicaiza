package com.ute.compose.material_mp

import androidx.compose.foundation.background
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.shape.CircleShape
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.*
import androidx.compose.material3.*
import androidx.compose.runtime.Composable
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.clip
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.tooling.preview.Preview
import androidx.compose.ui.unit.dp
import com.ute.compose.model_mp.Moto
import com.ute.compose.model_mp.motosDeMuestra

@Composable
fun TarjetaMoto(
    moto: Moto,
    onClick: () -> Unit = {},
    onLlamar: () -> Unit = {},
    onFavorito: () -> Unit = {}
) {
    ElevatedCard(
        onClick = onClick,
        modifier = Modifier.fillMaxWidth()
    ) {
        Row(
            modifier = Modifier.padding(12.dp),
            verticalAlignment = Alignment.CenterVertically
        ) {
            Box(
                modifier = Modifier
                    .size(52.dp)
                    .clip(CircleShape)
                    .background(MaterialTheme.colorScheme.primaryContainer),
                contentAlignment = Alignment.Center
            ) {
                Text(
                    text = moto.marca.first().uppercase(),
                    style = MaterialTheme.typography.titleLarge,
                    fontWeight = FontWeight.Bold,
                    color = MaterialTheme.colorScheme.onPrimaryContainer
                )
            }

            Spacer(Modifier.width(12.dp))

            Column(modifier = Modifier.weight(1f)) {
                Text(
                    text = "${moto.marca} ${moto.modelo}",
                    style = MaterialTheme.typography.titleSmall,
                    fontWeight = FontWeight.SemiBold
                )
                Text(
                    text = "$${moto.precio}",
                    style = MaterialTheme.typography.bodySmall,
                    color = MaterialTheme.colorScheme.onSurfaceVariant
                )
                Spacer(Modifier.height(4.dp))
                AssistChip(
                    onClick = {},
                    label = {
                        Text("${moto.cilindraje} cc",
                            style = MaterialTheme.typography.labelSmall)
                    }
                )
            }

            Column(horizontalAlignment = Alignment.CenterHorizontally) {
                IconButton(onClick = onFavorito) {
                    Icon(
                        imageVector = if (moto.favorito) Icons.Default.Favorite
                        else Icons.Default.FavoriteBorder,
                        contentDescription = if (moto.favorito) "Quitar favorito"
                        else "Marcar favorito",
                        tint = if (moto.favorito)
                            MaterialTheme.colorScheme.error
                        else
                            MaterialTheme.colorScheme.onSurfaceVariant
                    )
                }
                IconButton(onClick = onLlamar) {
                    Icon(
                        imageVector = Icons.Default.Phone,
                        contentDescription = "Llamar",
                        tint = MaterialTheme.colorScheme.primary
                    )
                }
            }
        }
    }
}

@Composable
fun Paso02Card_mpScreen() {
    Column(
        modifier = Modifier.fillMaxSize().padding(16.dp),
        verticalArrangement = Arrangement.spacedBy(12.dp)
    ) {
        Text("Paso 2 · Card - Catalogo Motos",
            style = MaterialTheme.typography.titleMedium)
        HorizontalDivider()

        Text("ElevatedCard — moto interactiva",
            style = MaterialTheme.typography.labelMedium,
            color = MaterialTheme.colorScheme.primary)

        motosDeMuestra.take(3).forEach { moto ->
            TarjetaMoto(
                moto = moto,
                onClick = { /* Paso 6: navegar al detalle */ },
                onLlamar = { /* Paso 6: snackbar */ },
                onFavorito = { /* Paso 3: toggle */ }
            )
        }

        HorizontalDivider()
        Text("Comparacion de variantes",
            style = MaterialTheme.typography.labelMedium,
            color = MaterialTheme.colorScheme.primary)

        Card(modifier = Modifier.fillMaxWidth()) {
            Text("Card — sin elevacion",
                Modifier.padding(16.dp))
        }

        ElevatedCard(modifier = Modifier.fillMaxWidth()) {
            Text("ElevatedCard — con sombra",
                Modifier.padding(16.dp))
        }

        OutlinedCard(modifier = Modifier.fillMaxWidth()) {
            Text("OutlinedCard — solo borde",
                Modifier.padding(16.dp))
        }
    }
}

@Preview(showBackground = true)
@Composable
fun Paso02CardMpPreview() {
    MaterialTheme { Paso02Card_mpScreen() }
}
