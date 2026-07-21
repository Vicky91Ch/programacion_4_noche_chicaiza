package com.ute.compose.material_mp

import androidx.compose.foundation.background
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.LazyRow
import androidx.compose.foundation.lazy.items
import androidx.compose.foundation.shape.CircleShape
import androidx.compose.foundation.text.KeyboardOptions
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.*
import androidx.compose.material.icons.outlined.*
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.clip
import androidx.compose.ui.graphics.vector.ImageVector
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.input.ImeAction
import androidx.compose.ui.text.input.KeyboardType
import androidx.compose.ui.tooling.preview.Preview
import androidx.compose.ui.unit.dp
import androidx.compose.ui.window.Dialog
import com.ute.compose.model_mp.Moto
import com.ute.compose.model_mp.motosDeMuestra

@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun Paso06Dialogos_mpScreen() {
    var motos by remember { mutableStateOf(motosDeMuestra) }
    var busqueda by remember { mutableStateOf("") }
    var filtro by remember { mutableStateOf("Todas") }
    var destinoActual by remember { mutableStateOf("catalogo") }

    var mostrarNuevo by remember { mutableStateOf(false) }
    var motoAEliminar by remember { mutableStateOf<Moto?>(null) }

    var mensajeSnack by remember { mutableStateOf<String?>(null) }
    val snackbarHostState = remember { SnackbarHostState() }

    LaunchedEffect(mensajeSnack) {
        mensajeSnack?.let {
            snackbarHostState.showSnackbar(it)
            mensajeSnack = null
        }
    }

    val motosFiltradas = motos
        .filter { m -> if (filtro == "Favoritas") m.favorito else true }
        .filter { m -> busqueda.isBlank() || m.marca.contains(busqueda, ignoreCase = true) }

    val destinos = listOf(
        DestinoNavMp("catalogo", "Catalogo", Icons.Filled.DirectionsBike, Icons.Outlined.DirectionsBike),
        DestinoNavMp("favoritas", "Favoritas", Icons.Filled.Favorite, Icons.Outlined.FavoriteBorder),
        DestinoNavMp("perfil", "Perfil", Icons.Filled.AccountCircle, Icons.Outlined.AccountCircle),
    )

    Scaffold(
        topBar = {
            TopAppBar(
                title = {
                    Text("Motos (${motos.size})", fontWeight = FontWeight.Bold)
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
                                MaterialTheme.colorScheme.onPrimaryContainer
                        )
                    }
                },
                colors = TopAppBarDefaults.topAppBarColors(
                    containerColor = MaterialTheme.colorScheme.primaryContainer,
                    titleContentColor = MaterialTheme.colorScheme.onPrimaryContainer
                )
            )
        },
        bottomBar = {
            NavigationBar {
                destinos.forEach { destino ->
                    val sel = destinoActual == destino.ruta
                    NavigationBarItem(
                        selected = sel,
                        onClick = { destinoActual = destino.ruta },
                        icon = {
                            Icon(if (sel) destino.iconoActivo else destino.iconoInactivo,
                                destino.etiqueta)
                        },
                        label = { Text(destino.etiqueta) }
                    )
                }
            }
        },
        floatingActionButton = {
            if (destinoActual == "catalogo") {
                FloatingActionButton(onClick = { mostrarNuevo = true }) {
                    Icon(Icons.Default.Add, "Nueva moto")
                }
            }
        },
        snackbarHost = { SnackbarHost(snackbarHostState) }

    ) { paddingValues ->
        when (destinoActual) {
            "catalogo" -> ContenidoCatalogo(
                motos = motosFiltradas,
                busqueda = busqueda,
                filtro = filtro,
                onBusqueda = { busqueda = it },
                onFiltro = { filtro = it },
                onFavorito = { id ->
                    motos = motos.map { m ->
                        if (m.id == id) m.copy(favorito = !m.favorito) else m
                    }
                },
                onLlamar = { nombre -> mensajeSnack = "Llamando a vendedor sobre $nombre..." },
                onEliminar = { moto -> motoAEliminar = moto },
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

    if (mostrarNuevo) {
        DialogNuevaMoto(
            onDismiss = { mostrarNuevo = false },
            onGuardar = { nueva ->
                motos = motos + nueva
                mostrarNuevo = false
                mensajeSnack = "${nueva.marca} ${nueva.modelo} agregada"
            }
        )
    }

    motoAEliminar?.let { moto ->
        AlertDialog(
            onDismissRequest = { motoAEliminar = null },
            icon = {
                Icon(Icons.Default.Warning, null,
                    tint = MaterialTheme.colorScheme.error)
            },
            title = { Text("Eliminar moto") },
            text = {
                Text("Seguro que quieres eliminar ${moto.marca} ${moto.modelo}? " +
                        "Esta accion no se puede deshacer.")
            },
            confirmButton = {
                Button(
                    onClick = {
                        motos = motos.filter { it.id != moto.id }
                        mensajeSnack = "${moto.marca} ${moto.modelo} eliminada"
                        motoAEliminar = null
                    },
                    colors = ButtonDefaults.buttonColors(
                        containerColor = MaterialTheme.colorScheme.error
                    )
                ) { Text("Eliminar") }
            },
            dismissButton = {
                OutlinedButton(onClick = { motoAEliminar = null }) {
                    Text("Cancelar")
                }
            }
        )
    }
}

@Composable
private fun ContenidoCatalogo(
    motos: List<Moto>,
    busqueda: String,
    filtro: String,
    onBusqueda: (String) -> Unit,
    onFiltro: (String) -> Unit,
    onFavorito: (Int) -> Unit,
    onLlamar: (String) -> Unit,
    onEliminar: (Moto) -> Unit,
    modifier: Modifier = Modifier
) {
    Column(modifier = modifier.fillMaxSize()) {
        OutlinedTextField(
            value = busqueda,
            onValueChange = onBusqueda,
            placeholder = { Text("Buscar moto...") },
            leadingIcon = { Icon(Icons.Default.Search, null) },
            trailingIcon = {
                if (busqueda.isNotEmpty())
                    IconButton(onClick = { onBusqueda("") }) {
                        Icon(Icons.Default.Clear, "Limpiar")
                    }
            },
            singleLine = true,
            modifier = Modifier.fillMaxWidth().padding(horizontal = 16.dp, vertical = 8.dp)
        )

        LazyRow(
            horizontalArrangement = Arrangement.spacedBy(8.dp),
            contentPadding = PaddingValues(horizontal = 16.dp)
        ) {
            items(listOf("Todas", "Favoritas")) { opcion ->
                FilterChip(
                    selected = filtro == opcion,
                    onClick = { onFiltro(opcion) },
                    label = { Text(opcion) },
                    leadingIcon = if (filtro == opcion) {{
                        Icon(Icons.Default.Check, null,
                            Modifier.size(FilterChipDefaults.IconSize))
                    }} else null
                )
            }
        }

        Spacer(Modifier.height(4.dp))

        if (motos.isEmpty()) {
            Box(Modifier.fillMaxSize(), contentAlignment = Alignment.Center) {
                Column(horizontalAlignment = Alignment.CenterHorizontally) {
                    Icon(Icons.Default.SearchOff, null, Modifier.size(56.dp),
                        tint = MaterialTheme.colorScheme.onSurfaceVariant)
                    Spacer(Modifier.height(8.dp))
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
                    Text("${motos.size} moto(s)",
                        style = MaterialTheme.typography.labelSmall,
                        color = MaterialTheme.colorScheme.onSurfaceVariant,
                        modifier = Modifier.padding(bottom = 4.dp))
                }
                items(motos, key = { it.id }) { moto ->
                    TarjetaMotoCompleta(
                        moto = moto,
                        onFavorito = { onFavorito(moto.id) },
                        onLlamar = { onLlamar("${moto.marca} ${moto.modelo}") },
                        onEliminar = { onEliminar(moto) }
                    )
                }
                item { Spacer(Modifier.height(100.dp)) }
            }
        }
    }
}

@Composable
private fun TarjetaMotoCompleta(
    moto: Moto,
    onFavorito: () -> Unit,
    onLlamar: () -> Unit,
    onEliminar: () -> Unit
) {
    ElevatedCard(modifier = Modifier.fillMaxWidth()) {
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
                    moto.marca.first().uppercase(),
                    style = MaterialTheme.typography.titleLarge,
                    fontWeight = FontWeight.Bold,
                    color = MaterialTheme.colorScheme.onPrimaryContainer
                )
            }
            Spacer(Modifier.width(12.dp))
            Column(Modifier.weight(1f)) {
                Text("${moto.marca} ${moto.modelo}", fontWeight = FontWeight.SemiBold,
                    style = MaterialTheme.typography.titleSmall)
                Text("$${moto.precio}",
                    style = MaterialTheme.typography.bodySmall,
                    color = MaterialTheme.colorScheme.onSurfaceVariant)
                Text("${moto.cilindraje} cc",
                    style = MaterialTheme.typography.bodySmall,
                    color = MaterialTheme.colorScheme.onSurfaceVariant)
            }
            IconButton(onClick = onFavorito) {
                Icon(
                    if (moto.favorito) Icons.Default.Favorite else Icons.Default.FavoriteBorder,
                    null,
                    tint = if (moto.favorito) MaterialTheme.colorScheme.error
                    else MaterialTheme.colorScheme.onSurfaceVariant
                )
            }
            IconButton(onClick = onLlamar) {
                Icon(Icons.Default.Phone, null,
                    tint = MaterialTheme.colorScheme.primary)
            }
            IconButton(onClick = onEliminar) {
                Icon(Icons.Default.Delete, null,
                    tint = MaterialTheme.colorScheme.error)
            }
        }
    }
}

@Composable
private fun DialogNuevaMoto(
    onDismiss: () -> Unit,
    onGuardar: (Moto) -> Unit
) {
    var marca by remember { mutableStateOf("") }
    var modelo by remember { mutableStateOf("") }
    var precio by remember { mutableStateOf("") }
    var cilindraje by remember { mutableStateOf("") }

    val marcaValida = marca.trim().length >= 2
    val modeloValido = modelo.trim().length >= 2
    val precioValido = precio.toDoubleOrNull() != null && (precio.toDoubleOrNull() ?: 0.0) > 0
    val cilindrajeValido = cilindraje.toIntOrNull() != null && (cilindraje.toIntOrNull() ?: 0) > 0
    val valido = marcaValida && modeloValido && precioValido && cilindrajeValido

    Dialog(onDismissRequest = onDismiss) {
        Card(modifier = Modifier.fillMaxWidth()) {
            Column(
                modifier = Modifier.padding(24.dp),
                verticalArrangement = Arrangement.spacedBy(12.dp)
            ) {
                Text("Nueva moto",
                    style = MaterialTheme.typography.titleLarge,
                    fontWeight = FontWeight.Bold)

                OutlinedTextField(
                    value = marca,
                    onValueChange = { marca = it },
                    label = { Text("Marca") },
                    leadingIcon = { Icon(Icons.Default.DirectionsBike, null) },
                    isError = marca.isNotEmpty() && !marcaValida,
                    singleLine = true,
                    modifier = Modifier.fillMaxWidth(),
                    keyboardOptions = KeyboardOptions(imeAction = ImeAction.Next)
                )

                OutlinedTextField(
                    value = modelo,
                    onValueChange = { modelo = it },
                    label = { Text("Modelo") },
                    leadingIcon = { Icon(Icons.Default.Sell, null) },
                    isError = modelo.isNotEmpty() && !modeloValido,
                    singleLine = true,
                    modifier = Modifier.fillMaxWidth(),
                    keyboardOptions = KeyboardOptions(imeAction = ImeAction.Next)
                )

                OutlinedTextField(
                    value = precio,
                    onValueChange = { precio = it },
                    label = { Text("Precio") },
                    leadingIcon = { Icon(Icons.Default.AttachMoney, null) },
                    isError = precio.isNotEmpty() && !precioValido,
                    singleLine = true,
                    modifier = Modifier.fillMaxWidth(),
                    keyboardOptions = KeyboardOptions(
                        keyboardType = KeyboardType.Decimal,
                        imeAction = ImeAction.Next
                    )
                )

                OutlinedTextField(
                    value = cilindraje,
                    onValueChange = { cilindraje = it },
                    label = { Text("Cilindraje (cc)") },
                    leadingIcon = { Icon(Icons.Default.Speed, null) },
                    isError = cilindraje.isNotEmpty() && !cilindrajeValido,
                    singleLine = true,
                    modifier = Modifier.fillMaxWidth(),
                    keyboardOptions = KeyboardOptions(
                        keyboardType = KeyboardType.Number,
                        imeAction = ImeAction.Done
                    )
                )

                Row(
                    modifier = Modifier.fillMaxWidth(),
                    horizontalArrangement = Arrangement.End,
                    verticalAlignment = Alignment.CenterVertically
                ) {
                    TextButton(onClick = onDismiss) { Text("Cancelar") }
                    Spacer(Modifier.width(8.dp))
                    Button(
                        onClick = {
                            onGuardar(
                                Moto(
                                    id = System.currentTimeMillis().toInt(),
                                    marca = marca.trim(),
                                    modelo = modelo.trim(),
                                    precio = precio.toDoubleOrNull() ?: 0.0,
                                    cilindraje = cilindraje.toIntOrNull() ?: 0
                                )
                            )
                        },
                        enabled = valido
                    ) { Text("Guardar") }
                }
            }
        }
    }
}

@Preview(showBackground = true)
@Composable
fun Paso06DialogosMpPreview() {
    MaterialTheme { Paso06Dialogos_mpScreen() }
}
