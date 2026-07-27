// lib/screens/pantalla_ventas_filtro_mp.dart
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../models/moto_venta_mp.dart';

class PantallaVentasFiltro extends StatelessWidget {
  final bool soloOferta;
  const PantallaVentasFiltro({super.key, this.soloOferta = false});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: Text('Ventas${soloOferta ? ' (Ofertas)' : ''}'),
        actions: [
          IconButton(
            icon: Icon(soloOferta ? Icons.local_offer : Icons.storefront),
            tooltip: soloOferta ? 'Ver todas' : 'Solo ofertas',
            onPressed: () => soloOferta
                ? context.go('/ventas')
                : context.go('/ventas?soloOferta=true'),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: motosSimuladas.length,
        itemBuilder: (context, i) {
          final m = motosSimuladas[i];
          return ListTile(
            leading: Icon(Icons.two_wheeler, color: cs.primary),
            title: Text('${m.marca} ${m.modelo}'),
            subtitle: Text('${m.cilindrada} · \$${m.precio.toStringAsFixed(0)}'),
            onTap: () => context.push('/ventas/${m.id}', extra: m),
          );
        },
      ),
    );
  }
}
