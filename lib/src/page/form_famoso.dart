import 'package:app_famosos/src/controller/famoso_controller.dart';
import 'package:app_famosos/src/widgets/form_input.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FormFamososPage extends StatelessWidget {
  const FormFamososPage({super.key});

  @override
  Widget build(BuildContext context) {
    var fx = Get.put(FamosoController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Agregar Famoso'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Obx(() {
              return FormInput(
                labelText: "Nombre",
                keyboardType: TextInputType.name,
                onChanged: fx.nombreChanged,
                controller: fx.ctrNombre.value,
                errorText: fx.errorNombre.value,
              );
            }),
            Obx(() {
              return FormInput(
                labelText: "Edad",
                keyboardType: TextInputType.number,
                onChanged: fx.edadChanged,
                controller: fx.ctrEdad.value,
                errorText: fx.errorEdad.value,
              );
            }),
            Obx(() {
              return FormInput(
                labelText: "Lugar de origen",
                keyboardType: TextInputType.text,
                onChanged: fx.origenChanged,
                controller: fx.ctrOrigen.value,
                errorText: fx.errorOrigen.value,
              );
            }),
            Obx(() {
              return FormInput(
                labelText: "Fecha de nacimiento",
                keyboardType: TextInputType.datetime,
                onChanged: fx.fNacimientoChanged,
                controller: fx.ctrNacimiento.value,
                errorText: fx.errorNacimiento.value,
              );
            }),
            Obx(() {
              return FormInput(
                labelText: "Tipo de famoso",
                keyboardType: TextInputType.text,
                onChanged: fx.tipoChanged,
                controller: fx.ctrTipo.value,
                errorText: fx.errorTipo.value,
              );
            }),
            Obx(() {
              return _buildGenderRadioButtons(fx);
            }),
            Obx(() {
              return FormInput(
                labelText: "Pareja",
                keyboardType: TextInputType.text,
                onChanged: fx.parejaChanged,
                controller: fx.ctrPareja.value,
                errorText: fx.errorPareja.value,
              );
            }),
            Obx(() {
              return ElevatedButton.icon(
                  onPressed: fx.submitFunc.value,
                  icon: const Icon(Icons.save),
                  label: const Text("Aceptar"));
            })
          ],
        ),
      ),
    );
  }

  Widget _buildGenderRadioButtons(FamosoController fx) {
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
              groupValue: fx.famosoGenero.value,
              onChanged: (String? value) {
                fx.generoChanged(value!);
              },
            ),
            const Text("Masculino"),
            Radio<String>(
              value: "F",
              groupValue: fx.famosoGenero.value,
              onChanged: (String? value) {
                fx.generoChanged(value!);
              },
            ),
            const Text("Femenino"),
          ],
        ),
      ],
    );
  }
}
