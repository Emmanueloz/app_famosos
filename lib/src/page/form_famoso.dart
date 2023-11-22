import 'package:app_famosos/src/controller/famoso_controller.dart';
import 'package:app_famosos/src/widgets/form_input.dart';
import 'package:app_famosos/src/widgets/form_input_date.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// Clase para la pagina del formulario de agregar o editar Famosos
class FormFamososPage extends StatelessWidget {
  const FormFamososPage({super.key});

  @override
  Widget build(BuildContext context) {
    var fx = Get.put(FamosoController());
    Icon iconFloatingActionButton = const Icon(Icons.save);
    if (Get.arguments != null) {
      fx.setAttributes(
          Get.arguments['id'],
          Get.arguments['nombre'],
          Get.arguments['origen'],
          Get.arguments['fechaNacimiento'],
          Get.arguments['tipo'],
          Get.arguments['genero'],
          Get.arguments['pareja']);
      iconFloatingActionButton = const Icon(Icons.edit);
    }
    Color colorFloatingActionButton = const Color.fromRGBO(220, 220, 220, 1);

    return Scaffold(
      appBar: AppBar(
        title: Text(Get.arguments != null ? 'Editar Famoso' : 'Agregar Famoso'),
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
                labelText: "Lugar de origen",
                keyboardType: TextInputType.text,
                onChanged: fx.origenChanged,
                controller: fx.ctrOrigen.value,
                errorText: fx.errorOrigen.value,
              );
            }),
            Obx(() {
              return FormInputDate(
                labelText: "Fecha de nacimiento",
                controller: fx.ctrNacimiento.value,
                onChanged: fx.fNacimientoChanged,
                initialDate: fx.faNacimiento.value,
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
          ],
        ),
      ),
      floatingActionButton: Obx(() {
        if (fx.submitFunc.value != null) {
          colorFloatingActionButton = Theme.of(context).primaryColor;
        } else {
          colorFloatingActionButton = const Color.fromRGBO(220, 220, 220, 1);
        }
        return FloatingActionButton(
          onPressed: fx.submitFunc.value,
          backgroundColor: colorFloatingActionButton,
          child: iconFloatingActionButton,
        );
      }),
    );
  }

  /// Esta función es para agregar los input de tipo radio en el formulario
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
