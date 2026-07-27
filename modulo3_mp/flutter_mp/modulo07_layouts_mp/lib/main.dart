// lib/main.dart
import 'package:flutter/material.dart';
import 'widgets/tarjeta_log_mp.dart';
import 'widgets/fila_estado_mp.dart';
import 'widgets/avatar_badge_mp.dart';

// ┌──────────────────────────────────────────────────────────────────┐
// │  Cambia este número y guarda (Ctrl+S) para navegar entre pasos. │
// │  1  Paso 1  Container — decoración y espaciado                  │
// │  2  Paso 2  Column — TarjetaLog (bitácora de ventas)            │
// │  3  Paso 3  Row + Expanded + Spacer — FilaEstado (motos)        │
// │  4  Paso 4  Stack + Positioned — AvatarBadge (vendedores)       │
// │  5  Paso 5  SizedBox, Padding, Align, Wrap                      │
// └──────────────────────────────────────────────────────────────────┘
const int paso = 5;

void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  home: switch (paso) {
     1 => _paso1(),
     2 => Scaffold(
      body: ListView(
        children: [
          TarjetaLog(nivel: 'ERROR', componente: 'venta-fallida',
              mensaje:   'Cliente canceló reserva de Kawasaki Z900',
              timestamp: DateTime.now()),
          TarjetaLog(nivel: 'WARN',  componente: 'inventario',
              mensaje:   'Solo 2 unidades de Suzuki GSX-R750 disponibles',
              timestamp: DateTime.now().subtract(const Duration(minutes: 2))),
          TarjetaLog(nivel: 'INFO',  componente: 'cierre-diario',
              mensaje:   'Reporte de ventas del día generado correctamente',
              timestamp: DateTime.now().subtract(const Duration(minutes: 5))),
          TarjetaLog(nivel: 'DEBUG', componente: 'sincronizar-stock',
              mensaje:   'Actualización de inventario completada (120ms)',
              timestamp: DateTime.now().subtract(const Duration(minutes: 8))),
        ],
      ),
    ),
     3 => const Scaffold(
      body: Column(
        children: [
          FilaEstado(nombre: 'Honda CBR 500R',     detalle: 'ABC-1234 · \$8.500',           activo: true),
          Divider(height: 1),
          FilaEstado(nombre: 'Yamaha MT-07',        detalle: 'DEF-5678 · \$7.200',           activo: true),
          Divider(height: 1),
          FilaEstado(nombre: 'Kawasaki Z900',       detalle: 'GHI-9012 · sin stock',         activo: false),
          Divider(height: 1),
          FilaEstado(nombre: 'Suzuki GSX-R750',
                     detalle: 'JKL-3456 · \$9.800', activo: true),
        ],
      ),
    ),
     4 => const Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AvatarBadge(nombre: 'Carlos', ventas: 5,  activo: true,  detalle: 'Carlos'),
            SizedBox(width: 24),
            AvatarBadge(nombre: 'María',  ventas: 3,  activo: true,  detalle: 'María'),
            SizedBox(width: 24),
            AvatarBadge(nombre: 'Pedro',  ventas: 0,  activo: false, detalle: 'Pedro'),
            SizedBox(width: 24),
            AvatarBadge(nombre: 'Ana',    ventas: 8,  activo: true,  detalle: 'Ana'),
            SizedBox(width: 24),
            AvatarBadge(nombre: 'DETALLE',ventas: 0,  activo: true,  detalle: 'ANA LÓPEZ'),
          ],
        ),
      ),
    ),
     5 => Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text('SizedBox', style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          const Text('Primer elemento'),
          const SizedBox(height: 32),
          const Text('Segundo elemento (después de 32px)'),
          const Divider(height: 32),
          const Text('Padding', style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Container(
            color: Colors.indigo.shade50,
            child: const Padding(
              padding: EdgeInsets.only(left: 24),
              child:   Text('Inventario con Padding izquierdo'),
            ),
          ),
          const Divider(height: 32),
          const Text('Align', style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          const Align(
            alignment: Alignment.centerRight,
            child: Icon(Icons.settings, color: Colors.indigo),
          ),
          const Divider(height: 32),
          const Text('Wrap', style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Wrap(
            spacing:    8,
            runSpacing: 8,
            children: ['Honda', 'Yamaha', 'Kawasaki', 'Suzuki', 'KTM', 'BMW', 'Ducati']
                .map((t) => Chip(label: Text(t)))
                .toList(),
          ),
        ],
      ),
    ),
      _ => Scaffold(body: Center(child: Text('Paso $paso: crea el widget primero'))),
  },
));

Widget _paso1() => Scaffold(
  body: Center(
    child: Container(
      width:     double.infinity,
      height:    80,
      margin:    const EdgeInsets.all(24),
      padding:   const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color:        Colors.indigo.shade50,
        borderRadius: BorderRadius.circular(40),
        border:       Border(left: BorderSide(color: Colors.indigo, width: 4)),
        boxShadow: [
          BoxShadow(
            color:      Colors.black.withOpacity(0.3),
            blurRadius: 8,
            offset:     const Offset(0, 2),
          ),
        ],
      ),
      child: const Text('Moto: Honda CBR 500R',
          style: TextStyle(fontWeight: FontWeight.bold)),
    ),
  ),
);
