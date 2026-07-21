package com.ute.compose.material_mp

import androidx.compose.foundation.layout.*
import androidx.compose.foundation.rememberScrollState
import androidx.compose.foundation.text.KeyboardOptions
import androidx.compose.foundation.verticalScroll
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.*
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Modifier
import androidx.compose.ui.text.input.ImeAction
import androidx.compose.ui.text.input.KeyboardType
import androidx.compose.ui.text.input.PasswordVisualTransformation
import androidx.compose.ui.text.input.VisualTransformation
import androidx.compose.ui.tooling.preview.Preview
import androidx.compose.ui.unit.dp

@Composable
fun Paso01TextField_mpScreen() {
    Column(
        modifier = Modifier
            .fillMaxSize()
            .padding(16.dp)
            .verticalScroll(rememberScrollState()),
        verticalArrangement = Arrangement.spacedBy(24.dp)
    ) {
        Text("Paso 1 · Registro de Moto",
            style = MaterialTheme.typography.titleMedium)
        HorizontalDivider()
        HorizontalDivider()
        DemoFormularioMoto()
    }
}

@Composable
private fun DemoBusquedaMoto() {
    var busqueda by remember { mutableStateOf("") }

    Column(verticalArrangement = Arrangement.spacedBy(8.dp)) {
        Text("Buscar moto en catalogo",
            style = MaterialTheme.typography.labelLarge,
            color = MaterialTheme.colorScheme.primary)

        OutlinedTextField(
            value = busqueda,
            onValueChange = { busqueda = it },
            placeholder = { Text("Buscar moto...") },
            leadingIcon = { Icon(Icons.Default.Search, contentDescription = null) },
            trailingIcon = {
                if (busqueda.isNotEmpty()) {
                    IconButton(onClick = { busqueda = "" }) {
                        Icon(Icons.Default.Clear, contentDescription = "Limpiar")
                    }
                }
            },
            singleLine = true,
            modifier = Modifier.fillMaxWidth()
        )

        Text(
            text = if (busqueda.isBlank()) "Escribe para buscar motos"
            else "Buscando: \"$busqueda\"",
            style = MaterialTheme.typography.bodySmall,
            color = MaterialTheme.colorScheme.onSurfaceVariant
        )
    }
}

@Composable
private fun DemoFormularioMoto() {
    var marca by remember { mutableStateOf("") }
    var modelo by remember { mutableStateOf("") }
    var precio by remember { mutableStateOf("") }
    var cilindraje by remember { mutableStateOf("") }

    val marcaValida = marca.trim().length >= 2
    val modeloValido = modelo.trim().length >= 2
    val precioValido = precio.toDoubleOrNull() != null && (precio.toDoubleOrNull() ?: 0.0) > 0
    val cilindrajeValido = cilindraje.toIntOrNull() != null && (cilindraje.toIntOrNull() ?: 0) > 0

    val formularioValido = marcaValida && modeloValido && precioValido && cilindrajeValido

    Column(verticalArrangement = Arrangement.spacedBy(12.dp)) {
        Text("Registro de nueva moto",
            style = MaterialTheme.typography.labelLarge,
            color = MaterialTheme.colorScheme.primary)

        OutlinedTextField(
            value = marca,
            onValueChange = { marca = it },
            label = { Text("Marca") },
            leadingIcon = { Icon(Icons.Default.DirectionsBike, contentDescription = null) },
            isError = marca.isNotEmpty() && !marcaValida,
            supportingText = {
                when {
                    marca.isNotEmpty() && !marcaValida ->
                        Text("Minimo 2 caracteres", color = MaterialTheme.colorScheme.error)
                    marcaValida ->
                        Text("Marca valida", color = MaterialTheme.colorScheme.primary)
                    else -> Text("Requerido")
                }
            },
            keyboardOptions = KeyboardOptions(imeAction = ImeAction.Next),
            singleLine = true,
            modifier = Modifier.fillMaxWidth()
        )

        OutlinedTextField(
            value = modelo,
            onValueChange = { modelo = it },
            label = { Text("Modelo") },
            placeholder = { Text("MT-07, CB190R...") },
            leadingIcon = { Icon(Icons.Default.Sell, contentDescription = null) },
            isError = modelo.isNotEmpty() && !modeloValido,
            supportingText = {
                if (modelo.isNotEmpty() && !modeloValido)
                    Text("Minimo 2 caracteres", color = MaterialTheme.colorScheme.error)
            },
            keyboardOptions = KeyboardOptions(imeAction = ImeAction.Next),
            singleLine = true,
            modifier = Modifier.fillMaxWidth()
        )

        OutlinedTextField(
            value = precio,
            onValueChange = { precio = it },
            label = { Text("Precio") },
            placeholder = { Text("7500.00") },
            leadingIcon = { Icon(Icons.Default.AttachMoney, contentDescription = null) },
            isError = precio.isNotEmpty() && !precioValido,
            supportingText = {
                if (precio.isNotEmpty() && !precioValido)
                    Text("Debe ser un numero positivo", color = MaterialTheme.colorScheme.error)
            },
            keyboardOptions = KeyboardOptions(
                keyboardType = KeyboardType.Decimal,
                imeAction = ImeAction.Next
            ),
            singleLine = true,
            modifier = Modifier.fillMaxWidth()
        )

        OutlinedTextField(
            value = cilindraje,
            onValueChange = { cilindraje = it },
            label = { Text("Cilindraje (cc)") },
            placeholder = { Text("689") },
            leadingIcon = { Icon(Icons.Default.Speed, contentDescription = null) },
            isError = cilindraje.isNotEmpty() && !cilindrajeValido,
            supportingText = {
                if (cilindraje.isNotEmpty() && !cilindrajeValido)
                    Text("Debe ser un numero entero positivo", color = MaterialTheme.colorScheme.error)
            },
            keyboardOptions = KeyboardOptions(
                keyboardType = KeyboardType.Number,
                imeAction = ImeAction.Done
            ),
            singleLine = true,
            modifier = Modifier.fillMaxWidth()
        )

        Button(
            onClick = { /* Paso 6: mostrar dialogo de confirmacion */ },
            enabled = formularioValido,
            modifier = Modifier.fillMaxWidth()
        ) {
            Text(if (formularioValido) "Registrar moto" else "Completa todos los campos")
        }
    }
}

@Preview(showBackground = true)
@Composable
fun Paso01TextFieldMpPreview() {
    MaterialTheme { Paso01TextField_mpScreen() }
}
