import 'package:flutter/material.dart';

class FormFamososPage extends StatelessWidget {
  const FormFamososPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Agregar Famoso'),
      ),
      body: const Center(
        child: Text('Formulario Famosos'),
      ),
    );
  }
}
