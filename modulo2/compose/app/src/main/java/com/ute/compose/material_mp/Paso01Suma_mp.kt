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
fun Paso01Suma_mpScreen() {
    Column(
        modifier = Modifier
            .fillMaxSize()
            .padding(16.dp)
            .verticalScroll(rememberScrollState()),
        verticalArrangement = Arrangement.spacedBy(24.dp)
    ) {
        Text("Paso 1 · Suma de precios - Ventas Motos",
            style = MaterialTheme.typography.titleMedium)
        HorizontalDivider()
        HorizontalDivider()
        SumaPreciosMotos()
    }
}

@Composable
private fun SumaPreciosMotos() {
    var precio1 by remember { mutableStateOf("") }
    var precio2 by remember { mutableStateOf("") }
    var resultado by remember { mutableStateOf("") }

    Column(verticalArrangement = Arrangement.spacedBy(12.dp)) {
        Text("Cotizacion de dos motos",
            style = MaterialTheme.typography.labelLarge,
            color = MaterialTheme.colorScheme.primary)

        OutlinedTextField(
            value = precio1,
            onValueChange = { precio1 = it },
            label = { Text("Precio primera moto") },
            leadingIcon = { Icon(Icons.Default.AttachMoney, contentDescription = null) },
            keyboardOptions = KeyboardOptions(imeAction = ImeAction.Next),
            singleLine = true,
            modifier = Modifier.fillMaxWidth()
        )

        OutlinedTextField(
            value = precio2,
            onValueChange = { precio2 = it },
            label = { Text("Precio segunda moto") },
            leadingIcon = { Icon(Icons.Default.AttachMoney, contentDescription = null) },
            keyboardOptions = KeyboardOptions(imeAction = ImeAction.Next),
            singleLine = true,
            modifier = Modifier.fillMaxWidth()
        )

        Button(
            onClick = {
                val valor1 = precio1.toDoubleOrNull() ?: 0.0
                val valor2 = precio2.toDoubleOrNull() ?: 0.0
                resultado = (valor1 + valor2).toString()
            },
            modifier = Modifier.fillMaxWidth()
        ) {
            Text("Sumar precios")
        }
    }
    Text(text = "Total: \$$precio1 + \$$precio2 = \$$resultado")
}

@Preview(showBackground = true)
@Composable
fun Paso01SumaMpPreview() {
    MaterialTheme { Paso01Suma_mpScreen() }
}
