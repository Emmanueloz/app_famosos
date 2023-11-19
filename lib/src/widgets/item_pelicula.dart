import 'package:app_famosos/src/controller/peliculas_list.dart';
import 'package:app_famosos/src/models/pelicula_modelo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemPelicula extends StatelessWidget {
  final PeliculaModelo peliculas;
  const ItemPelicula({
    super.key,
    required this.peliculas,
  });

  @override
  Widget build(BuildContext context) {
    //Se manda a llamar el controlador de las lista
    final PeliculasListController ctrList = Get.find();
    return Card(
        child: Dismissible(
      key: UniqueKey(),
      direction: DismissDirection.endToStart,
      background: Container(),
      secondaryBackground: Container(
        color: Colors.red,
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.all(10),
        child: const Icon(Icons.delete),
      ),
      onDismissed: ((direction) => {
            if (direction == DismissDirection.endToStart)
              {ctrList.delete(peliculas)}
          }),
      child: ListTile(
        title: Text(peliculas.nombre),
        subtitle: Text(
          peliculas.genero,
          //style: TextStyle(color: tipoColor),
        ),
        onTap: () {
          // Acción que se realiza al tocar el ListTile (navegar a la pantalla de edición)
          Get.toNamed('formPeliculas', arguments: {
            'id': peliculas.id,
            'nombre': peliculas.nombre,
            'genero': peliculas.genero,
            'ao': peliculas.ao,
            'productor': peliculas.productor,
            'director': peliculas.director,
          });
        },
      ),
    ));
  }
}
