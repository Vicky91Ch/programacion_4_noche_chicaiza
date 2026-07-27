// lib/screens/pantalla_paso1_mp.dart
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import '../models/moto_dto_mp.dart';
import '../models/api_error_mp.dart';

class PantallaPaso1 extends StatefulWidget {
  const PantallaPaso1({super.key});
  @override
  State<PantallaPaso1> createState() => _PantallaPaso1State();
}

class _PantallaPaso1State extends State<PantallaPaso1> {
  List<MotoDto> _motos = [];
  bool          _loading = true;
  String?       _error;

  @override
  void initState() {
    super.initState();
    _fetchMotos();
  }

  Future<void> _fetchMotos() async {
    try {
      final baseUrl = dotenv.env['API_BASE_URL'];
      final res = await http.get(Uri.parse('$baseUrl/motos/'));
      if (res.statusCode != 200) {
        final apiErr = ApiError.fromJson(jsonDecode(res.body));
        throw Exception(apiErr.mensaje);
      }
      final decoded = jsonDecode(res.body);
      final list = decoded is List
          ? decoded
          : (decoded['results'] ?? decoded['data'] ?? decoded['motos']) as List;
      setState(() {
        _motos   = list.map((j) => MotoDto.fromJson(j)).toList();
        _loading = false;
      });
    } catch (e) {
      setState(() { _error = e.toString(); _loading = false; });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Paso 1 · HTTP básico')),
      body: _loading
          ? const Center(child: CircularProgressIndicator())
          : _error != null
              ? Center(child: Text(_error!))
              : ListView.builder(
                  itemCount: _motos.length,
                  itemBuilder: (_, i) => ListTile(
                    leading: const Icon(Icons.two_wheeler),
                    title: Text('${_motos[i].marca} ${_motos[i].modelo}'),
                    subtitle: Text(_motos[i].cilindrada),
                  ),
                ),
    );
  }
}