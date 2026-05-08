// MainActivity.kt
package com.example.compose

import android.os.Bundle
import androidx.activity.ComponentActivity
import androidx.activity.compose.setContent
import androidx.compose.material3.MaterialTheme
import com.example.compose.screens.S01_SaludoScreen
import com.example.compose.material.Paso06_DialogosScreen

class MainActivity: ComponentActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContent {
            MaterialTheme {
                // ◀ CAMBIA AQUÍ para probar cada sección:
                // S01_SaludoScreen()
                // ...
                Paso06_DialogosScreen()
            }
        }
    }
}