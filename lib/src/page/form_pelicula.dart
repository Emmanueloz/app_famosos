import 'package:app_famosos/src/controller/peliculas_controller.dart';
import 'package:app_famosos/src/widgets/form_input.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FormPeliculasPage extends StatelessWidget {
  const FormPeliculasPage({super.key});

  @override
  Widget build(BuildContext context) {
    var fx = Get.put(PeliculaController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Agregar Películas'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(10),
        child: Column(children: [
          Obx(() {
            return FormInput(
              labelText: 'Nombre',
              keyboardType: TextInputType.text,
              onChanged: fx.nombreChanged,
              controller: fx.ctrNombre.value,
              errorText: fx.errorNombre.value,
            );
          }),
          Obx(() {
            return FormInput(
              labelText: 'Genero',
              keyboardType: TextInputType.text,
              onChanged: fx.generoChanged,
              controller: fx.ctrGenero.value,
              errorText: fx.errorGenero.value,
            );
          }),
          Obx(() {
            return FormInput(
              labelText: 'Año',
              keyboardType: TextInputType.number,
              onChanged: fx.aoChanged,
              controller: fx.ctrAo.value,
              errorText: fx.errorAo.value,
            );
          }),
          Obx(() {
            return FormInput(
              labelText: 'Productor',
              keyboardType: TextInputType.text,
              onChanged: fx.productorChanged,
              controller: fx.ctrProductor.value,
              errorText: fx.errorProductor.value,
            );
          }),
          Obx(() {
            return FormInput(
              labelText: 'Director',
              keyboardType: TextInputType.text,
              onChanged: fx.directorChanged,
              controller: fx.ctrDirector.value,
              errorText: fx.errorDirector.value,
            );
          }),
          Obx(() {
            return ElevatedButton.icon(
                onPressed: fx.submitFunc.value,
                icon: const Icon(Icons.save),
                label: const Text("Aceptar"));
          })
        ]),
      ),
    );
  }
}
