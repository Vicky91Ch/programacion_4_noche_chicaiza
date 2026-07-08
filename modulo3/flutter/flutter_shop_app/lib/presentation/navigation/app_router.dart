// lib/presentation/navigation/app_router.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_shop_app/presentation/navigation/public_shell.dart';
import 'package:flutter_shop_app/presentation/screens/cart/cart_screen.dart';
import 'package:flutter_shop_app/presentation/screens/catalog/catalog_screen.dart';
import 'package:flutter_shop_app/presentation/screens/catalog/home_screen.dart';
import 'package:flutter_shop_app/presentation/screens/catalog/productdetailscreen.dart';
import 'package:flutter_shop_app/presentation/screens/orders/orderdetailscreen.dart';
import 'package:go_router/go_router.dart';

import '../shell/public_shell.dart';
import '../screens/home_screen.dart';
import '../screens/catalog_screen.dart';
import '../screens/cart_screen.dart';
import '../screens/product_detail_screen.dart';
import '../screens/orders/orders_screen.dart';
import '../screens/orders/order_detail_screen.dart';
import '../screens/auth/profile_screen.dart';

final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: '/',
    routes: [
      // ── Rutas CON BottomNavBar (envueltas en el ShellRoute) ──────
      ShellRoute(
        builder: (_, __, child) => PublicShell(child: child),
        routes: [
          GoRoute(
            path: '/',
            builder: (_, __) => const HomeScreen(),
          ),
          GoRoute(
            path: '/catalog',
            builder: (_, __) => const CatalogScreen(),
            // 👆 Sin ':id' anidado aquí — ver nota abajo sobre '/catalog/:id'.
          ),
          GoRoute(
            path: '/cart',
            builder: (_, __) => const CartScreen(),
          ),
          GoRoute(
            path: '/orders',
            builder: (_, __) => const OrdersScreen(),
          ),
          GoRoute(
            path: '/orders/:id',
            builder: (_, s) => OrderDetailScreen(
              orderId: int.parse(s.pathParameters['id']!),
            ),
          ),
          GoRoute(
            path: '/profile',
            builder: (_, __) => const ProfileScreen(),
          ),
        ],
      ),

      // ── Rutas SIN BottomNavBar (fuera del ShellRoute) ────────────
      // '/catalog/:id' es una ruta completa e independiente, NO hija de
      // otra definición de '/catalog'. Así evitamos el conflicto de paths
      // duplicados y logramos que el detalle se vea a pantalla completa.
      GoRoute(
        path: '/catalog/:id',
        builder: (_, state) {
          final id = int.parse(state.pathParameters['id']!);
          return ProductDetailScreen(productId: id);
        },
      ),

      // ... aquí irían tus rutas de admin, al mismo nivel que '/catalog/:id'
    ],
  );
});