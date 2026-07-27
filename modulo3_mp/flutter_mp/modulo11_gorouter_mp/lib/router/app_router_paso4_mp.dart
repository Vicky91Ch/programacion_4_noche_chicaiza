// lib/router/app_router_paso4_mp.dart
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../screens/scaffold_con_nav_mp.dart';
import '../screens/pantalla_ventas_mp.dart';
import '../screens/pantalla_detalle_mp.dart';
import '../screens/pantalla_metricas_mp.dart';
import '../screens/pantalla_ajustes_mp.dart';
import '../models/moto_venta_mp.dart';

final appRouterPaso4Mp = GoRouter(
  initialLocation: '/ventas',
  debugLogDiagnostics: true,
  routes: [
    ShellRoute(
      builder: (context, state, child) => ScaffoldConNav(child: child),
      routes: [
        GoRoute(
          path: '/ventas',
          builder: (_, __) => const PantallaVentas(),
          routes: [
            GoRoute(
              path: ':id',
              builder: (context, state) {
                final id   = state.pathParameters['id']!;
                final moto = state.extra as MotoVenta?;
                return PantallaDetalle(id: id, moto: moto);
              },
            ),
          ],
        ),
        GoRoute(
          path: '/metricas',
          builder: (_, __) => const PantallaMetricas(),
        ),
        GoRoute(
          path: '/ajustes',
          builder: (_, __) => const PantallaAjustes(),
        ),
      ],
    ),
  ],
);
