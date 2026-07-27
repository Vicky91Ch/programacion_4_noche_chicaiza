// lib/router/app_router_paso3_mp.dart
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../screens/pantalla_inicio_mp.dart';
import '../screens/pantalla_ventas_filtro_mp.dart';
import '../screens/pantalla_detalle_mp.dart';
import '../models/moto_venta_mp.dart';

final appRouterPaso3Mp = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const PantallaInicio(),
    ),
    GoRoute(
      path: '/ventas',
      builder: (context, state) {
        final soloOferta = state.uri.queryParameters['soloOferta'] == 'true';
        return PantallaVentasFiltro(soloOferta: soloOferta);
      },
    ),
    GoRoute(
      path: '/ventas/:id',
      builder: (context, state) {
        final id   = state.pathParameters['id']!;
        final moto = state.extra as MotoVenta?;
        return PantallaDetalle(id: id, moto: moto);
      },
    ),
  ],
);
