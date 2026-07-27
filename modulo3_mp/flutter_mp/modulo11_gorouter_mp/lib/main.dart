// lib/main.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:modulo11_gorouter_mp/router/app_router_paso2_mp.dart';
import 'package:modulo11_gorouter_mp/router/app_router_paso3_mp.dart';
import 'package:modulo11_gorouter_mp/router/app_router_paso4_mp.dart';
import 'router/app_router_mp.dart';

const int paso = 4;

void main() {
  runApp(ProviderScope(child: AppConcesionario(paso: paso)));
}

class AppConcesionario extends StatelessWidget {
  final int paso;
  const AppConcesionario({super.key, required this.paso});

  @override
  Widget build(BuildContext context) {
    final router = switch (paso) {
      1 => appRouterMp,
      2 => appRouterPaso2Mp,
      3 => appRouterPaso3Mp,
      4 => appRouterPaso4Mp,
      _ => appRouterMp,
    };

    return MaterialApp.router(
      title: 'Concesionario de Motos',
      debugShowCheckedModeBanner: false,
      routerConfig: router,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF0D47A1)),
        useMaterial3: true,
      ),
    );
  }
}
