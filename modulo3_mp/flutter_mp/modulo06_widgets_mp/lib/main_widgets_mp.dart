// lib/main_widgets_mp.dart
import 'package:flutter/material.dart';

void main() => runApp(
  const MaterialApp(
    home: Scaffold(
      body: Center(
        child: SizedBox(width: double.infinity, child: Aviso()),
      ),
    ),
  ),
);

class Aviso extends StatelessWidget {
  const Aviso({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Nuevas motocicletas Honda y Yamaha disponibles en showroom',
      textAlign: TextAlign.left,
      style: TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.bold,
        letterSpacing: 4,
        color: Colors.indigo,
        shadows: [Shadow(color: Colors.black26, blurRadius: 4, offset: Offset(2,2))]
      ),
      overflow: TextOverflow.ellipsis,
      maxLines: 3,
    );
  }
}
