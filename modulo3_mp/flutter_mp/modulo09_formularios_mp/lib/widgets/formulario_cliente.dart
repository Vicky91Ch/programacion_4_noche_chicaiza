// lib/widgets/formulario_cliente.dart
import 'package:flutter/material.dart';

class FormularioCliente extends StatefulWidget {
  final void Function(Map<String, String> datos) onGuardar;
  const FormularioCliente({super.key, required this.onGuardar});

  @override
  State<FormularioCliente> createState() => _FormularioClienteState();
}

class _FormularioClienteState extends State<FormularioCliente> {
  final _formKey    = GlobalKey<FormState>();
  final _ctrlNombre = TextEditingController();
  final _ctrlCedula = TextEditingController();
  final _ctrlTelefono = TextEditingController();
  final _ctrlEmail  = TextEditingController();
  final _focusCedula = FocusNode();
  final _focusTelefono = FocusNode();
  final _focusEmail = FocusNode();

  static final _regexCedula = RegExp(r'^\d{10}$');
  static final _regexEmail = RegExp(r'^[\w\.\-]+@[\w\.\-]+\.\w+$');

  @override
  void dispose() {
    _ctrlNombre.dispose();
    _ctrlCedula.dispose();
    _ctrlTelefono.dispose();
    _ctrlEmail.dispose();
    _focusCedula.dispose();
    _focusTelefono.dispose();
    _focusEmail.dispose();
    super.dispose();
  }

  void _guardar() {
    if (!_formKey.currentState!.validate()) return;
    widget.onGuardar({
      'nombre':   _ctrlNombre.text,
      'cedula':   _ctrlCedula.text,
      'telefono': _ctrlTelefono.text,
      'email':    _ctrlEmail.text,
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
            controller: _ctrlNombre,
            decoration: const InputDecoration(
              labelText: 'Nombre completo',
              prefixIcon: Icon(Icons.person), border: OutlineInputBorder(),
            ),
            textInputAction: TextInputAction.next,
            onFieldSubmitted: (_) => _focusCedula.requestFocus(),
            validator: (v) {
              if (v == null || v.trim().isEmpty) return 'El nombre es obligatorio';
              if (v.length < 3) return 'Mínimo 3 caracteres';
              return null;
            },
          ),
          const SizedBox(height: 12),
          TextFormField(
            controller: _ctrlCedula, focusNode: _focusCedula,
            decoration: const InputDecoration(
              labelText: 'Cédula',
              hintText: '1712345678',
              prefixIcon: Icon(Icons.badge), border: OutlineInputBorder(),
            ),
            keyboardType: TextInputType.number,
            textInputAction: TextInputAction.next,
            onFieldSubmitted: (_) => _focusTelefono.requestFocus(),
            validator: (v) {
              if (v == null || v.isEmpty) return 'La cédula es obligatoria';
              if (!_regexCedula.hasMatch(v)) return 'Debe tener 10 dígitos';
              return null;
            },
          ),
          const SizedBox(height: 12),
          TextFormField(
            controller: _ctrlTelefono, focusNode: _focusTelefono,
            decoration: const InputDecoration(
              labelText: 'Teléfono',
              hintText: '0991234567',
              prefixIcon: Icon(Icons.phone), border: OutlineInputBorder(),
            ),
            keyboardType: TextInputType.phone,
            textInputAction: TextInputAction.next,
            onFieldSubmitted: (_) => _focusEmail.requestFocus(),
            validator: (v) => v == null || v.isEmpty ? 'El teléfono es obligatorio' : null,
          ),
          const SizedBox(height: 12),
          TextFormField(
            controller: _ctrlEmail, focusNode: _focusEmail,
            decoration: const InputDecoration(
              labelText: 'Email',
              hintText: 'cliente@email.com',
              prefixIcon: Icon(Icons.email), border: OutlineInputBorder(),
            ),
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.done,
            onFieldSubmitted: (_) => FocusScope.of(context).unfocus(),
            validator: (v) {
              if (v == null || v.isEmpty) return null; // email es opcional
              if (!_regexEmail.hasMatch(v)) return 'Formato de email inválido';
              return null;
            },
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
              label: const Text('Guardar cliente'),
            )),
          ]),
        ],
      ),
    );
  }
}
