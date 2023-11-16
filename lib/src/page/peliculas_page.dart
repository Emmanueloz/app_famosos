import 'package:app_famosos/src/page/form_pelicula.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PeliculasPage extends StatelessWidget {
  const PeliculasPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Películas'),
      ),
      body: const Center(
        child: Text('Películas'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.to(() => const FormPeliculasPage()),
        child: const Icon(Icons.add),
      ),
    );
  }
}
