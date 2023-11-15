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
        padding: const EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            _buildTextField("Nombre", TextInputType.name),
            _buildTextField("Edad", TextInputType.number),
            _buildTextField("Lugar de origen", TextInputType.text),
            _buildTextField("Fecha de nacimiento", TextInputType.datetime),
            _buildTextField("Tipo de famoso", TextInputType.text),
            _buildGenderRadioButtons(),
            _buildTextField("Pareja", null),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(String labelText, TextInputType? keyboardType) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        keyboardType: keyboardType,
        decoration: InputDecoration(
          labelText: labelText,
        ),
      ),
    );
  }

  Widget _buildGenderRadioButtons() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Text(
          "Género",
          style: TextStyle(fontSize: 16),
        ),
        Row(
          children: <Widget>[
            Radio<String>(
              value: "M",
              groupValue: "gender",
              onChanged: (String? value) {
                print(value);
              },
            ),
            const Text("Masculino"),
            Radio<String>(
              value: "F",
              groupValue: "gender",
              onChanged: (String? value) {
                print(value);
              },
            ),
            const Text("Femenino"),
          ],
        ),
      ],
    );
  }
}
