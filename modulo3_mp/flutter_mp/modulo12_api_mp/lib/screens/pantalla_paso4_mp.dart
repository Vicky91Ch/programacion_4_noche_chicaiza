// lib/screens/pantalla_paso4_mp.dart
import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import '../models/moto_dto_mp.dart';
import '../models/api_error_mp.dart';

class PantallaPaso4 extends StatefulWidget {
  const PantallaPaso4({super.key});
  @override
  State<PantallaPaso4> createState() => _PantallaPaso4State();
}

class _PantallaPaso4State extends State<PantallaPaso4> {
  List<MotoDto> _motos    = [];
  bool          _loading  = true;
  String?       _error;
  bool          _autoRefresh = false;
  Timer?        _timer;

  @override
  void initState() {
    super.initState();
    _fetchMotos();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
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
          : (decoded['results'] ?? decoded['data'] ?? []) as List;
      setState(() {
        _motos   = list.map((j) => MotoDto.fromJson(j)).toList();
        _loading = false;
      });
    } catch (e) {
      setState(() { _error = e.toString(); _loading = false; });
    }
  }

  void _toggleAutoRefresh() {
    setState(() => _autoRefresh = !_autoRefresh);
    _timer?.cancel();
    if (_autoRefresh) {
      _timer = Timer.periodic(const Duration(seconds: 5), (_) => _fetchMotos());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Paso 4 · Auto-refresh'),
        actions: [
          Switch(
            value: _autoRefresh,
            onChanged: (_) => _toggleAutoRefresh(),
          ),
        ],
      ),
      body: _loading
          ? const Center(child: CircularProgressIndicator())
          : _error != null
              ? Center(child: Text(_error!))
              : RefreshIndicator(
                  onRefresh: _fetchMotos,
                  child: ListView.builder(
                    itemCount: _motos.length,
                    itemBuilder: (_, i) => ListTile(
                      leading: const Icon(Icons.two_wheeler),
                      title: Text('${_motos[i].marca} ${_motos[i].modelo}'),
                      subtitle: Text(_motos[i].vendida ? 'Vendida' : 'Disponible'),
                      trailing: Icon(
                        _motos[i].vendida ? Icons.check_circle : Icons.inventory,
                        color: _motos[i].vendida ? Colors.green : Colors.orange,
                      ),
                    ),
                  ),
                ),
    );
  }
}