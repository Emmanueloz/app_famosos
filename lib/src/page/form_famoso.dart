import 'package:app_famosos/src/widgets/form_input.dart';
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
            const FormInput(
                labelText: "Nombre", keyboardType: TextInputType.name),
            const FormInput(
                labelText: "Edad", keyboardType: TextInputType.number),
            const FormInput(
                labelText: "Lugar de origen", keyboardType: TextInputType.text),
            const FormInput(
                labelText: "Fecha de nacimiento",
                keyboardType: TextInputType.datetime),
            const FormInput(
                labelText: "Tipo de famoso", keyboardType: TextInputType.text),
            _buildGenderRadioButtons(),
            const FormInput(labelText: "Pareja", keyboardType: null),
            ElevatedButton.icon(
                onPressed: null,
                icon: const Icon(Icons.save),
                label: const Text("Aceptar"))
          ],
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
