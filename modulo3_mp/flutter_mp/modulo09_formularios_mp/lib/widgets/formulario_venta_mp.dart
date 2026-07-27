// lib/widgets/formulario_venta_mp.dart
import 'package:flutter/material.dart';

class FormularioVenta extends StatefulWidget {
  final void Function(Map<String, String> datos) onGuardar;
  const FormularioVenta({super.key, required this.onGuardar});

  @override
  State<FormularioVenta> createState() => _FormularioVentaState();
}

class _FormularioVentaState extends State<FormularioVenta> {
  final _formKey     = GlobalKey<FormState>();
  final _ctrlMarca   = TextEditingController();
  final _ctrlModelo  = TextEditingController();
  final _ctrlPrecio  = TextEditingController();
  final _ctrlCilindrada = TextEditingController(text: '150');
  final _focusModelo = FocusNode();
  final _focusPrecio = FocusNode();
  final _focusCilindrada = FocusNode();
  String _colorMoto  = 'Rojo';
  bool   _enOferta   = false;

  static final _regexPrecio = RegExp(r'^\d+$');

  @override
  void dispose() {
    _ctrlMarca.dispose();
    _ctrlModelo.dispose();
    _ctrlPrecio.dispose();
    _ctrlCilindrada.dispose();
    _focusModelo.dispose();
    _focusPrecio.dispose();
    _focusCilindrada.dispose();
    super.dispose();
  }

  void _guardar() {
    if (!_formKey.currentState!.validate()) return;
    widget.onGuardar({
      'marca':      _ctrlMarca.text,
      'modelo':     _ctrlModelo.text,
      'precio':     _ctrlPrecio.text,
      'cilindrada': _ctrlCilindrada.text,
      'color':      _colorMoto,
      'oferta':     _enOferta.toString(),
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextFormField(
            controller: _ctrlMarca,
            decoration: const InputDecoration(
              labelText: 'Marca', hintText: 'Honda',
              prefixIcon: Icon(Icons.business), border: OutlineInputBorder(),
            ),
            textInputAction: TextInputAction.next,
            onFieldSubmitted: (_) => _focusModelo.requestFocus(),
            validator: (v) {
              if (v == null || v.trim().isEmpty) return 'La marca es obligatoria';
              if (v.length < 2) return 'Mínimo 2 caracteres';
              return null;
            },
          ),
          const SizedBox(height: 12),
          TextFormField(
            controller: _ctrlModelo, focusNode: _focusModelo,
            decoration: const InputDecoration(
              labelText: 'Modelo', hintText: 'CBR 500R',
              prefixIcon: Icon(Icons.two_wheeler), border: OutlineInputBorder(),
            ),
            textInputAction: TextInputAction.next,
            onFieldSubmitted: (_) => _focusCilindrada.requestFocus(),
            validator: (v) => v == null || v.trim().isEmpty ? 'El modelo es obligatorio' : null,
          ),
          const SizedBox(height: 12),
          TextFormField(
            controller: _ctrlCilindrada, focusNode: _focusCilindrada,
            decoration: const InputDecoration(
              labelText: 'Cilindrada (cc)',
              prefixIcon: Icon(Icons.speed), border: OutlineInputBorder(),
            ),
            keyboardType: TextInputType.number,
            textInputAction: TextInputAction.next,
            onFieldSubmitted: (_) => _focusPrecio.requestFocus(),
            validator: (v) {
              final cc = int.tryParse(v ?? '');
              if (cc == null) return 'Debe ser un número';
              if (cc < 50 || cc > 2000) return 'Cilindrada entre 50 y 2000cc';
              return null;
            },
          ),
          const SizedBox(height: 12),
          TextFormField(
            controller: _ctrlPrecio, focusNode: _focusPrecio,
            decoration: const InputDecoration(
              labelText: 'Precio',
              prefixIcon: Icon(Icons.attach_money), border: OutlineInputBorder(),
            ),
            keyboardType: TextInputType.number,
            textInputAction: TextInputAction.next,
            onFieldSubmitted: (_) => FocusScope.of(context).unfocus(),
            validator: (v) {
              if (v == null || v.isEmpty) return 'El precio es obligatorio';
              if (!_regexPrecio.hasMatch(v)) return 'Solo números';
              final p = int.parse(v);
              if (p < 1000) return 'Precio mínimo \$1.000';
              return null;
            },
          ),
          const SizedBox(height: 12),
          DropdownButtonFormField<String>(
            value: _colorMoto,
            decoration: const InputDecoration(
              labelText: 'Color',
              prefixIcon: Icon(Icons.palette), border: OutlineInputBorder(),
            ),
            items: ['Rojo', 'Azul', 'Negro', 'Blanco', 'Verde', 'Gris']
                .map((s) => DropdownMenuItem(value: s, child: Text(s))).toList(),
            onChanged: (v) => setState(() => _colorMoto = v!),
          ),
          const SizedBox(height: 8),
          SwitchListTile(
            title: const Text('En oferta'),
            subtitle: const Text('Aplicar descuento especial'),
            value: _enOferta,
            onChanged: (v) => setState(() => _enOferta = v),
            secondary: const Icon(Icons.local_offer),
          ),
          const SizedBox(height: 16),
          Row(children: [
            Expanded(child: OutlinedButton(
              onPressed: () => _formKey.currentState?.reset(),
              child: const Text('Limpiar'),
            )),
            const SizedBox(width: 12),
            Expanded(flex: 2, child: FilledButton.icon(
              onPressed: _guardar,
              icon: const Icon(Icons.save),
              label: const Text('Guardar moto'),
            )),
          ]),
        ],
      ),
    );
  }
}
