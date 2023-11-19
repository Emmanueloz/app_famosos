import 'package:app_famosos/src/controller/famosos_list.dart';
import 'package:app_famosos/src/models/famoso_modelo.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemFamosos extends StatelessWidget {
  final FamosoModelo famosos;
  const ItemFamosos({
    super.key,
    required this.famosos,
  });

  @override
  Widget build(BuildContext context) {
    final FamososListController ctrList = Get.find();
    Color tipoColor = Colors.black;

    if (famosos.genero == "M") {
      tipoColor = Colors.blue;
    } else if (famosos.genero == "F") {
      tipoColor = Colors.pink;
    }

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
              {ctrList.delete(famosos)}
          }),
      child: ListTile(
        title: Text(famosos.nombre),
        subtitle: Text(
          famosos.tipo,
          style: TextStyle(color: tipoColor),
        ),
        onTap: () {
          // Acción que se realiza al tocar el ListTile (navegar a la pantalla de edición)
          Get.toNamed('formFamoso', arguments: {
            'id': famosos.id,
            'nombre': famosos.nombre,
            'edad': famosos.edad,
            'origen': famosos.origen,
            'fechaNacimiento': famosos.fechaNacimiento,
            'tipo': famosos.tipo,
            'genero': famosos.genero,
            'pareja': famosos.pareja,
          });
        },
      ),
    ));
  }
}
