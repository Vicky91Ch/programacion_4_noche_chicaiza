// lib/screens/pantalla_paso3_mp.dart
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import '../models/moto_dto_mp.dart';
import '../models/cliente_dto.dart';
import '../models/pedido_dto.dart';
import '../models/api_error_mp.dart';

class PantallaPaso3 extends StatefulWidget {
  const PantallaPaso3({super.key});
  @override
  State<PantallaPaso3> createState() => _PantallaPaso3State();
}

class _PantallaPaso3State extends State<PantallaPaso3> {
  List<MotoDto>   _motos    = [];
  List<ClienteDto> _clientes = [];
  bool            _loading  = true;
  String?         _error;
  String?         _respuestaPost;

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  List _extraerLista(dynamic decoded) {
    return decoded is List
        ? decoded
        : (decoded['results'] ?? decoded['data'] ?? []) as List;
  }

  Future<void> _fetchData() async {
    try {
      final baseUrl = dotenv.env['API_BASE_URL'];
      final results = await Future.wait([
        http.get(Uri.parse('$baseUrl/motos/')),
        http.get(Uri.parse('$baseUrl/clientes/')),
      ]);
      final mRes = results[0];
      final cRes = results[1];

      if (mRes.statusCode != 200) throw Exception('Error motos');
      if (cRes.statusCode != 200) throw Exception('Error clientes');

      final motosList    = _extraerLista(jsonDecode(mRes.body));
      final clientesList = _extraerLista(jsonDecode(cRes.body));

      setState(() {
        _motos    = motosList.map((j) => MotoDto.fromJson(j)).toList();
        _clientes = clientesList.map((j) => ClienteDto.fromJson(j)).toList();
        _loading  = false;
      });
    } catch (e) {
      setState(() { _error = e.toString(); _loading = false; });
    }
  }

  Future<void> _registrarVenta() async {
    if (_motos.isEmpty || _clientes.isEmpty) return;
    final pedido = PedidoDto(motoId: _motos.first.id, clienteId: _clientes.first.id);
    try {
      final baseUrl = dotenv.env['API_BASE_URL'];
      final res = await http.post(
        Uri.parse('$baseUrl/ventas/'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(pedido.toJson()),
      );
      if (res.statusCode != 201) {
        final apiErr = ApiError.fromJson(jsonDecode(res.body));
        throw Exception(apiErr.mensaje);
      }
      setState(() => _respuestaPost = 'Venta registrada: ${res.body}');
    } catch (e) {
      setState(() => _respuestaPost = 'Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Paso 3 · POST / ventas')),
      body: _loading
          ? const Center(child: CircularProgressIndicator())
          : _error != null
              ? Center(child: Text(_error!))
              : Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Motos: ${_motos.length}'),
                      Text('Clientes: ${_clientes.length}'),
                      const SizedBox(height: 12),
                      FilledButton(
                        onPressed: _registrarVenta,
                        child: const Text('Registrar venta (POST)'),
                      ),
                      if (_respuestaPost != null) ...[
                        const SizedBox(height: 12),
                        Card(child: Padding(
                          padding: const EdgeInsets.all(12),
                          child: Text(_respuestaPost!),
                        )),
                      ],
                    ],
                  ),
                ),
    );
  }
}