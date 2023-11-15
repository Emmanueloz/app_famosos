import 'package:app_famosos/widgets/bottom_navigation.dart';
import 'package:flutter/material.dart';

class FormFamososPage extends StatelessWidget {
  const FormFamososPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Agregar Famoso',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Agregar Famoso'),
        ),
        body: const Center(
          child: Text('Famosos'),
        ),
        bottomNavigationBar: const BottomNav(),
      ),
    );
  }
}
