// MainActivity.kt
package com.ute.compose

import android.os.Bundle
import androidx.activity.ComponentActivity
import androidx.activity.compose.setContent
import androidx.compose.material3.MaterialTheme
import com.ute.compose.screens.*
import com.ute.compose.material.*
import com.ute.compose.material_mp.Paso01Suma_mpScreen
import com.ute.compose.material_mp.Paso01TextField_mpScreen
import com.ute.compose.material_mp.Paso02Card_mpScreen
import com.ute.compose.material_mp.Paso03LazyColumn_mpScreen
import com.ute.compose.material_mp.Paso04Scaffold_mpScreen
import com.ute.compose.material_mp.Paso05NavBar_mpScreen
import com.ute.compose.material_mp.Paso06Dialogos_mpScreen
import com.ute.compose.screens_mp.S01Saludo_mpScreen
import com.ute.compose.screens_mp.S02Text_mpScreen
import com.ute.compose.screens_mp.S03Button_mpScreen
import com.ute.compose.screens_mp.S04Layout_mpScreen
import com.ute.compose.screens_mp.S05Modifier_mpScreen
import com.ute.compose.screens_mp.S06Estado_mpScreen
import com.ute.compose.screens_mp.S07StateHoisting_mpScreen
import com.ute.compose.screens_mp.S08Bienvenida_mpScreen


class MainActivityMp : ComponentActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContent {
            MaterialTheme {
                // ◀ CAMBIA AQUÍ para probar cada sección:
                // S01Saludo_mpScreen()
                // S02Text_mpScreen()
                // S03Button_mpScreen()
                // S04Layout_mpScreen()
                // S05Modifier_mpScreen()
                // S06Estado_mpScreen()
                // S07StateHoisting_mpScreen()
                // S08Bienvenida_mpScreen()

                // Material 3 TextField, Card, LazyColumn, Scaffold y diálogos
                // ◀ CAMBIA AQUÍ para probar cada paso:
                // Paso01TextField_mpScreen()
                // Paso01Suma_mpScreen()
                // Paso02Card_mpScreen()
                // Paso03LazyColumn_mpScreen()
                // Paso04Scaffold_mpScreen()
                // Paso05NavBar_mpScreen()
                Paso06Dialogos_mpScreen()   // ← paso activo

            }
        }
    }
}