import 'package:app_famosos/widgets/bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MoviePage extends StatelessWidget {
  const MoviePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Películas',
      home: Scaffold(
          appBar: AppBar(
            title: const Text('Películas'),
          ),
          body: const Center(
            child: Text('Películas'),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () => Get.offNamed("agregarPremios"),
            child: const Icon(Icons.add),
          ),
          bottomNavigationBar: const BottomNav()),
    );
  }
}
