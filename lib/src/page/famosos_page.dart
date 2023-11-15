import 'package:app_famosos/src/widgets/bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FamososPage extends StatelessWidget {
  const FamososPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Famosos',
      home: Scaffold(
          appBar: AppBar(
            title: const Text('Famosos'),
          ),
          body: const Center(
            child: Text('Famosos'),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () => Get.offNamed("agregarFamoso"),
            child: const Icon(Icons.add),
          ),
          bottomNavigationBar: const BottomNav()),
    );
  }
}
