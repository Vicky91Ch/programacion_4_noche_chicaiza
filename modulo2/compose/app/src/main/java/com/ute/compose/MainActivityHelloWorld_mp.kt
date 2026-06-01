package com.ute.compose

import android.os.Bundle
import androidx.activity.ComponentActivity
import androidx.activity.compose.setContent
import androidx.activity.enableEdgeToEdge
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.padding
import androidx.compose.material3.Scaffold
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.ui.Modifier
import androidx.compose.ui.tooling.preview.Preview
import com.ute.compose.ui_mp.theme.ComposeThemeMp

class MainActivityHelloWorldMp : ComponentActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        enableEdgeToEdge()
        setContent {
            ComposeThemeMp {
                Scaffold(modifier = Modifier.fillMaxSize()) { innerPadding ->
                    SaludarMoto(
                        name = "Mundo Moto",
                        modifier = Modifier.padding(innerPadding)
                    )
                }
            }
        }
    }
}

@Composable
fun SaludarMoto(name: String, modifier: Modifier = Modifier) {
    Text(
        text = "Bienvenido a Ventas de Motos, $name!",
        modifier = modifier
    )
}

@Preview(showBackground = true)
@Composable
fun SaludarMotoPreview() {
    ComposeThemeMp {
        SaludarMoto("Mundo Moto")
    }
}
