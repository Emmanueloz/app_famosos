import 'package:app_famosos/src/controller/peliculas_controller.dart';
import 'package:app_famosos/src/widgets/form_input.dart';
import 'package:app_famosos/src/widgets/form_input_year.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// Clase para la pagina del formulario de agregar o editar Pelicula
class FormPeliculasPage extends StatelessWidget {
  const FormPeliculasPage({super.key});

  @override
  Widget build(BuildContext context) {
    var fx = Get.put(PeliculaController());
    if (Get.arguments != null) {
      fx.setAttributes(
          Get.arguments['id'],
          Get.arguments['nombre'],
          Get.arguments['genero'],
          Get.arguments['ao'],
          Get.arguments['productor'],
          Get.arguments['director']);
    }
    Color colorFloatingActionButton = const Color.fromRGBO(220, 220, 220, 1);
    return Scaffold(
        appBar: AppBar(
          title: Text(
              Get.arguments != null ? 'Editar Película' : 'Agregar Película'),
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
              return FormInputYear(
                labelText: "Año de estreno",
                controller: fx.ctrAo.value,
                onChanged: fx.aoChanged,
                selectedDate: int.tryParse(fx.peliculaAo.value),
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
          ]),
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
            child: const Icon(Icons.save),
          );
        }));
  }
}
