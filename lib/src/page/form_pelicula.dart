import 'package:app_famosos/src/widgets/form_input.dart';
import 'package:flutter/material.dart';

class FormPeliculasPage extends StatelessWidget {
  const FormPeliculasPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Agregar Películas'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(10),
        child: Column(children: <Widget>[
          const FormInput(
            labelText: 'Nombre',
            keyboardType: TextInputType.text,
          ),
          const FormInput(
            labelText: 'Genero',
            keyboardType: TextInputType.text,
          ),
          const FormInput(
            labelText: 'Año',
            keyboardType: TextInputType.number,
          ),
          const FormInput(
            labelText: 'Productor',
            keyboardType: TextInputType.text,
          ),
          const FormInput(
            labelText: 'Director',
            keyboardType: TextInputType.text,
          ),
          ElevatedButton.icon(
              onPressed: null,
              icon: const Icon(Icons.save),
              label: const Text("Aceptar"))
        ]),
      ),
    );
  }
}
