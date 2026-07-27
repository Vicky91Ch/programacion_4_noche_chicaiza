// lib/router/app_router_mp.dart
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../screens/pantalla_inicio_mp.dart';
import '../screens/pantalla_ventas_mp.dart';

final appRouterMp = GoRouter(
  initialLocation: '/',
  debugLogDiagnostics: true,
  routes: [
    GoRoute(
      path: '/',
      name: 'inicio',
      builder: (context, state) => const PantallaInicio(),
    ),
    GoRoute(
      path: '/ventas',
      name: 'ventas',
      builder: (context, state) => const PantallaVentas(),
    ),
  ],
);
