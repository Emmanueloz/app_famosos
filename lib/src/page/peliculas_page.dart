import 'package:app_famosos/src/controller/peliculas_list.dart';
import 'package:app_famosos/src/page/form_pelicula.dart';
import 'package:app_famosos/src/widgets/item_pelicula.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PeliculasPage extends StatelessWidget {
  PeliculasPage({super.key});

  final PeliculasListController ctr = Get.put(PeliculasListController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Películas'),
      ),
      body: Obx(() => ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: ctr.listPeliculas.length,
            itemBuilder: (BuildContext context, int index) {
              var peliculas = ctr.listPeliculas[index];
              return ItemPelicula(peliculas: peliculas);
            },
          )),
      floatingActionButton: FloatingActionButton(
        /// El Get.to es un método que sirve para cambiar de pagina, se usa en el botón flotante
        onPressed: () => Get.to(() => const FormPeliculasPage()),
        child: const Icon(Icons.add),
      ),
    );
  }
}
