import 'package:flutter/material.dart';

void main() {
  runApp(const MiApp());
}

class MiApp extends StatelessWidget {
  const MiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Home Screen App',
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // 1. Imagen de fondo que cubre toda la pantalla
          Positioned.fill(
            child: Image.asset(
              'assets/background.jpg', // Confirma que coincida con tu archivo
              fit: BoxFit.cover,
            ),
          ),
          
          // Capa oscura de sobreposición (Overlay) para mejorar la legibilidad/contraste UX
          Positioned.fill(
            child: Container(
              color: Colors.black.withValues(alpha: 0.4),
            ),
          ),

          // 2. Contenido principal (Bienvenida, Icono y Nombre de la App)
          SafeArea(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Icono principal
                    const Icon(
                      Icons.movie_filter_rounded,
                      size: 80,
                      color: Colors.white,
                    ),
                    const SizedBox(height: 24),

                    // Mensaje de bienvenida (Hello World / Bienvenida)
                    const Text(
                      'Hello World!',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        letterSpacing: 1.2,
                      ),
                    ),
                    const SizedBox(height: 12),

                    // Nombre de la aplicación
                    const Text(
                      'Mi Aplicación de Cine',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white70,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}