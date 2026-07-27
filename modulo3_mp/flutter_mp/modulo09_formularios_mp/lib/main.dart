// lib/main.dart
// lib/main.dart
import 'package:flutter/material.dart';
import 'package:modulo09_formularios_mp/models/moto_venta_mp.dart';
import 'package:modulo09_formularios_mp/screens/pantalla_busqueda_mp.dart';
import 'package:modulo09_formularios_mp/screens/pantalla_ventas_mp.dart';
import 'package:modulo09_formularios_mp/widgets/fila_venta_mp.dart';
import 'package:modulo09_formularios_mp/widgets/formulario_venta_mp.dart';

const int paso = 6;

void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  theme: ThemeData(
    colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF1B5E20)),
    useMaterial3: true,
  ),
  home: switch (paso) {
    1 => const _Paso1(),
    2 => const _Paso2(),
    3 => const _Paso3(),
    4 => const PantallaVentas(),
    5 => const PantallaBusqueda(),
    _ => Scaffold(body: Center(child: Text('Paso $paso: crea el widget primero'))),
  },
));

class _Paso1 extends StatefulWidget {
  const _Paso1();
  @override
  State<_Paso1> createState() => _Paso1State();
}

class _Paso1State extends State<_Paso1> {
  final _ctrlMarca    = TextEditingController();
  final _ctrlModelo   = TextEditingController();
  final _ctrlCilindrada = TextEditingController(text: '150');
  final _ctrlPrecio   = TextEditingController();
  final _focusModelo  = FocusNode();
  final _focusCilindrada = FocusNode();
  final _focusPrecio  = FocusNode();

  @override
  void dispose() {
    _ctrlMarca.dispose();
    _ctrlModelo.dispose();
    _ctrlCilindrada.dispose();
    _ctrlPrecio.dispose();
    _focusModelo.dispose();
    _focusCilindrada.dispose();
    _focusPrecio.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title:           const Text('Nueva moto'),
        backgroundColor: cs.primaryContainer,
        foregroundColor: cs.onPrimaryContainer,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _ctrlMarca,
              decoration: const InputDecoration(
                labelText: 'Marca',
                hintText: 'Honda',
                prefixIcon: Icon(Icons.business),
                border: OutlineInputBorder(),
              ),
              textInputAction: TextInputAction.next,
              onSubmitted: (_) => _focusModelo.requestFocus(),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _ctrlModelo,
              focusNode: _focusModelo,
              decoration: const InputDecoration(
                labelText: 'Modelo',
                hintText: 'CBR 500R',
                prefixIcon: Icon(Icons.two_wheeler),
                border: OutlineInputBorder(),
              ),
              textInputAction: TextInputAction.next,
              onSubmitted: (_) => _focusCilindrada.requestFocus(),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _ctrlCilindrada,
              focusNode: _focusCilindrada,
              decoration: const InputDecoration(
                labelText: 'Cilindrada (cc)',
                prefixIcon: Icon(Icons.speed),
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
              textInputAction: TextInputAction.next,
              onSubmitted: (_) => _focusPrecio.requestFocus(),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _ctrlPrecio,
              focusNode: _focusPrecio,
              decoration: const InputDecoration(
                labelText: 'Precio',
                prefixIcon: Icon(Icons.attach_money),
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
              textInputAction: TextInputAction.done,
              onSubmitted: (_) => FocusScope.of(context).unfocus(),
            ),
            const SizedBox(height: 20),
            FilledButton.icon(
              onPressed: () {
                FocusScope.of(context).unfocus();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      'Registrando ${_ctrlMarca.text} ${_ctrlModelo.text} '
                      '(${_ctrlCilindrada.text}cc · \$${_ctrlPrecio.text})',
                    ),
                    behavior: SnackBarBehavior.floating,
                  ),
                );
              },
              icon: const Icon(Icons.save),
              label: const Text('Registrar'),
            ),
            const SizedBox(height: 8),
            OutlinedButton(
              onPressed: () {
                _ctrlMarca.clear();
                _ctrlModelo.clear();
                _ctrlCilindrada.text = '150';
                _ctrlPrecio.clear();
              },
              child: const Text('Limpiar campos'),
            ),
          ],
        ),
      ),
    );
  }
}

class _Paso2 extends StatelessWidget {
  const _Paso2();
  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        title:           const Text('Nueva venta'),
        backgroundColor: cs.primaryContainer,
        foregroundColor: cs.onPrimaryContainer,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: FormularioVenta(
          onGuardar: (datos) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Venta: ${datos['marca']} ${datos['modelo']} — \$${datos['precio']}'),
                behavior: SnackBarBehavior.floating,
              ),
            );
          },
        ),
      ),
    );
  }
}

class _Paso3 extends StatefulWidget {
  const _Paso3();
  @override
  State<_Paso3> createState() => _Paso3State();
}

class _Paso3State extends State<_Paso3> {
  final _ventas = [
    MotoVenta(id:'1', marca:'Honda',  modelo:'CBR 500R',  cilindrada:500,  precio:8500,  colorMoto:'Rojo',    vendida:true,  enOferta:true),
    MotoVenta(id:'2', marca:'Yamaha', modelo:'MT-07',     cilindrada:689,  precio:7200,  colorMoto:'Azul',    vendida:false, enOferta:false),
    MotoVenta(id:'3', marca:'Kawasaki',modelo:'Z900',     cilindrada:948,  precio:11500, colorMoto:'Verde',   vendida:false, enOferta:true),
    MotoVenta(id:'4', marca:'Suzuki', modelo:'GSX-R750',  cilindrada:750,  precio:9800,  colorMoto:'Negro',   vendida:true,  enOferta:false),
  ];

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        title:           Text('Ventas (${_ventas.length})'),
        backgroundColor: cs.primaryContainer,
        foregroundColor: cs.onPrimaryContainer,
      ),
      body: _ventas.isEmpty
          ? Center(child: Column(mainAxisSize: MainAxisSize.min, children: [
              Icon(Icons.two_wheeler_outlined, size: 56, color: cs.onSurfaceVariant),
              const SizedBox(height: 12),
              Text('Sin ventas registradas', style: TextStyle(color: cs.onSurfaceVariant)),
            ]))
          : ListView.separated(
              itemCount: _ventas.length,
              separatorBuilder: (_, __) => const Divider(height: 1, indent: 72),
              itemBuilder: (ctx, i) => FilaVenta(
                venta: _ventas[i],
                onOferta: () => setState(() => _ventas[i].enOferta = !_ventas[i].enOferta),
                onEliminar: () => setState(() => _ventas.removeAt(i)),
              ),
            ),
    );
  }
}
