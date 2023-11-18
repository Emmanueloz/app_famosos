import 'package:app_famosos/src/controller/peliculas_controller.dart';
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
      body: Obx(
        () => ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: ctr.listPelicula.length,
          itemBuilder: (BuildContext context, int index) {
            var peliculas = ctr.listPelicula[index];
            return ItemPelicula( peliculas : peliculas);
        },
      )
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.to(() => const FormPeliculasPage()),
        child: const Icon(Icons.add),
      ),
    );
  }
}
