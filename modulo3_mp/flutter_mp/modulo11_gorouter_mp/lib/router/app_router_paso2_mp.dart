// lib/router/app_router_paso2_mp.dart
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../screens/pantalla_inicio_mp.dart';
import '../screens/pantalla_ventas_mp.dart';
import '../screens/pantalla_detalle_mp.dart';
import '../models/moto_venta_mp.dart';

final appRouterPaso2Mp = GoRouter(
  initialLocation: '/',
  debugLogDiagnostics: true,
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const PantallaInicio(),
    ),
    GoRoute(
      path: '/ventas',
      builder: (context, state) => const PantallaVentas(),
      routes: [
        GoRoute(
          path: ':id',
          builder: (context, state) {
            final id   = state.pathParameters['id']!;
            final moto = state.extra as MotoVenta?;
            return PantallaDetalle(id: id, moto: moto);
          },
        ),
        GoRoute(
          path: ':id/historial',
          builder: (context, state) {
            final id = state.pathParameters['id']!;
            return Scaffold(
              appBar: AppBar(title: Text('Historial de $id')),
              body: Center(child: Text('Historial de venta de la moto $id')),
            );
          },
        ),
      ],
    ),
  ],
);
