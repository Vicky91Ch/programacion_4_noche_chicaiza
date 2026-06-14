package com.shopapp.presentation.ui.admin.notifications

import androidx.compose.foundation.layout.*
import androidx.compose.foundation.rememberScrollState
import androidx.compose.foundation.verticalScroll
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.automirrored.filled.ArrowBack
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Modifier
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.unit.dp
import androidx.hilt.navigation.compose.hiltViewModel
import com.shopapp.presentation.viewmodel.SendNotificationViewModel
import com.shopapp.theme.*

@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun SendNotificationScreen(
    onBack:    () -> Unit,
    viewModel: SendNotificationViewModel = hiltViewModel(),
) {
    val state by viewModel.state.collectAsState()

    var subject by remember { mutableStateOf("") }
    var message by remember { mutableStateOf("") }
    var userId  by remember { mutableStateOf("") }

    Scaffold(
        topBar = {
            TopAppBar(
                title = { Text("Enviar notificación") },
                navigationIcon = {
                    IconButton(onClick = onBack) {
                        Icon(
                            imageVector        = Icons.AutoMirrored.Filled.ArrowBack,
                            contentDescription = "Volver",
                        )
                    }
                },
                colors = TopAppBarDefaults.topAppBarColors(
                    containerColor = Surface,
                ),
            )
        },
        containerColor = Background,
    ) { innerPadding ->

        Column(
            modifier = Modifier
                .fillMaxSize()
                .padding(innerPadding)
                .verticalScroll(rememberScrollState())
                .padding(24.dp),
            verticalArrangement = Arrangement.spacedBy(16.dp),
        ) {

            if (state.error != null) {
                Surface(
                    color    = Error.copy(alpha = 0.1f),
                    shape    = MaterialTheme.shapes.small,
                    modifier = Modifier.fillMaxWidth(),
                ) {
                    Text(
                        text     = state.error!!,
                        color    = Error,
                        style    = MaterialTheme.typography.bodySmall,
                        modifier = Modifier.padding(12.dp),
                    )
                }
            }

            if (state.result != null) {
                Surface(
                    color    = Success.copy(alpha = 0.1f),
                    shape    = MaterialTheme.shapes.small,
                    modifier = Modifier.fillMaxWidth(),
                ) {
                    Text(
                        text     = state.result!!.detail,
                        color    = Success,
                        style    = MaterialTheme.typography.bodySmall,
                        modifier = Modifier.padding(12.dp),
                    )
                }
            }

            OutlinedTextField(
                value         = subject,
                onValueChange = { subject = it },
                label         = { Text("Asunto") },
                placeholder   = { Text("Ej: Promoción especial") },
                modifier      = Modifier.fillMaxWidth(),
                enabled       = !state.isLoading,
                singleLine    = true,
            )

            OutlinedTextField(
                value         = message,
                onValueChange = { message = it },
                label         = { Text("Mensaje") },
                placeholder   = { Text("Escribe el contenido del correo...") },
                modifier      = Modifier
                    .fillMaxWidth()
                    .height(160.dp),
                enabled       = !state.isLoading,
                maxLines      = 8,
            )

            OutlinedTextField(
                value         = userId,
                onValueChange = { userId = it },
                label         = { Text("ID de usuario (opcional)") },
                placeholder   = { Text("Dejar vacío para envío masivo") },
                modifier      = Modifier.fillMaxWidth(),
                enabled       = !state.isLoading,
                singleLine    = true,
            )

            Text(
                text  = if (userId.isBlank()) "Se enviará a todos los usuarios activos"
                else "Se enviará al usuario con ID: $userId",
                style = MaterialTheme.typography.bodySmall,
                color = TextSecondary,
            )

            Button(
                onClick  = {
                    viewModel.send(
                        subject = subject,
                        message = message,
                        userId  = userId.toIntOrNull(),
                    )
                },
                modifier = Modifier
                    .fillMaxWidth()
                    .height(52.dp),
                enabled  = subject.isNotBlank() && message.isNotBlank() && !state.isLoading,
                colors   = ButtonDefaults.buttonColors(containerColor = Accent),
                shape    = MaterialTheme.shapes.medium,
            ) {
                if (state.isLoading) {
                    CircularProgressIndicator(
                        modifier = Modifier.size(20.dp),
                        color    = AccentOnDark,
                    )
                } else {
                    Text(
                        text       = "Enviar notificación",
                        fontWeight = FontWeight.SemiBold,
                        color      = AccentOnDark,
                    )
                }
            }
        }
    }
}