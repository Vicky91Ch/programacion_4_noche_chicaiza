// lib/main.dart
import 'package:flutter/material.dart';
import 'package:modulo06_widgets_mp/widgets/contador_limitado_mp.dart';
import 'package:modulo06_widgets_mp/widgets/etiqueta_mp.dart';
import 'package:modulo06_widgets_mp/widgets/indicador_mp.dart';
import 'package:modulo06_widgets_mp/widgets/pantalla_contexto_mp.dart';
import 'package:modulo06_widgets_mp/widgets/reloj_mp.dart';
import 'package:modulo06_widgets_mp/widgets/servicio_estado_mp.dart';
import 'widgets/catalogo_basicos_mp.dart';

// ┌──────────────────────────────────────────────────────────────────┐
// │  Cambia este número y guarda (Ctrl+S) para navegar entre pasos. │
// │  1  Paso 1   StatelessWidget mínimo                             │
// │  2  Paso 1b  Widgets básicos — catálogo (motos)                 │
// │  3  Paso 2   StatelessWidget con parámetros (estados de venta)  │
// │  4  Paso 3   StatefulWidget / setState / proceso de venta        │
// │  5  Paso 3b  Parámetros en StatefulWidget (stock limitado)      │
// │  6  Paso 4   Ciclo de vida con Timer (cronómetro de ventas)     │
// │  7  Paso 5   BuildContext                                        │
// │  8  Paso 6   Composición de widgets (KPIs de ventas)            │
// └──────────────────────────────────────────────────────────────────┘
const int paso =8;

void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  theme: ThemeData(
    colorScheme:  ColorScheme.fromSeed(
      seedColor:  const Color.fromARGB(255, 150, 0, 130),
      brightness: Brightness.light,
    ),
    useMaterial3: true,
  ),
  home: switch (paso) {
    1 => const Scaffold(body: Center(child: Saludo())),
    2 => const CatalogoBasicos(),
    3 => const Scaffold(
      body: Center(
        child: Wrap(
          spacing:    12,
          runSpacing: 8,
          children: [
            Etiqueta(texto: 'Nueva',     color: Colors.green),
            Etiqueta(texto: 'Vendida',   color: Colors.red,    relleno: true),
            Etiqueta(texto: 'Oferta',    color: Colors.orange),
            Etiqueta(texto: 'Agotada',   color: Colors.red,    fontSize: 16, relleno: true),
            Etiqueta(texto: 'Disponible',color: Colors.blue,   fontSize: 11),
          ],
        ),
      ),
    ),
    4 => const Scaffold(
      body: Center(
        child: ProcesoVenta(nombre: 'venta-honda-cbr500-001'),
      ),
    ),
    5 => Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ContadorLimitado(
              etiqueta: 'Motos en showroom',
              limite:   15,
              color:    Colors.red,
              onLimite: () => debugPrint('¡Showroom lleno!'),
            ),
            const SizedBox(height: 40),
            ContadorLimitado(
              etiqueta: 'Reservas activas',
              limite:   8,
              color:    Colors.indigo,
            ),
          ],
        ),
      ),
    ),
    6 => Scaffold(
      appBar: AppBar(title: const Text('Cronómetro de venta')),
      body: const Center(child: Reloj()),
    ),
    7 => const PantallaContexto(),
    8 => Scaffold(
      body: Center(
        child: Wrap(
          spacing:    32,
          runSpacing: 24,
          alignment:  WrapAlignment.center,
          children: const [
            Indicador(label: 'Motos en inventario', valor: '24',
                      color: Colors.green, icono: Icons.two_wheeler),
            Indicador(label: 'Ventas del mes',      valor: '8',
                      color: Colors.red,   icono: Icons.trending_up,
                      subtitulo: 'Meta: 12'),
            Indicador(label: 'Ingresos',            valor: '\$48.500',
                      color: Colors.indigo),
            Indicador(label: 'Satisfacción',        valor: '96.2%',
                      color: Colors.teal, subtitulo: 'Últimos 30 días'),
          ],
        ),
      ),
    ),
    _ => Scaffold(body: Center(child: Text('Paso $paso: crea el widget primero'))),
  },
));


class Saludo extends StatelessWidget {
  const Saludo({super.key});
  @override
  Widget build(BuildContext context) =>
      const Text('Concesionario de Motos', style: TextStyle(fontSize: 32));
}
