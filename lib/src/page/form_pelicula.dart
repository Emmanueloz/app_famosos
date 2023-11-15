import 'package:app_famosos/src/widgets/bottom_navigation.dart';
import 'package:flutter/material.dart';

class FormMoviePage extends StatelessWidget {
  const FormMoviePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Agregar Películas',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Agregar Películas'),
        ),
        body: const Center(
          child: Text('Formulario de películas'),
        ),
        bottomNavigationBar: const BottomNav(),
      ),
    );
  }
}
