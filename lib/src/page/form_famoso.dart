import 'package:flutter/material.dart';

class FormFamososPage extends StatelessWidget {
  const FormFamososPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Agregar Famoso'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10),
          child: const Column(children: <Widget>[
            TextField(
              keyboardType: TextInputType.name,
              decoration: InputDecoration(
                labelText: "Nombre",
              ),
            ),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Edad",
              ),
            ),
            TextField(
              decoration: InputDecoration(
                labelText: "Lugar de origen",
              ),
            ),
            TextField(
              keyboardType: TextInputType.datetime,
              decoration: InputDecoration(
                labelText: "Fecha de nacimiento",
              ),
            ),
            TextField(
              decoration: InputDecoration(
                labelText: "Tipo de famoso",
              ),
            ),
            TextField(
              decoration: InputDecoration(
                labelText: "Genero",
              ),
            ),
            TextField(
              decoration: InputDecoration(
                labelText: "Pareja",
              ),
            )
          ]),
        ),
      ),
    );
  }
}
