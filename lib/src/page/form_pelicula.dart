import 'package:flutter/material.dart';

class FormPeliculasPage extends StatelessWidget {
  const FormPeliculasPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Agregar Películas'),
      ),
      body: const Center(
        child: Text('Formulario de películas'),
      ),
    );
  }
}
