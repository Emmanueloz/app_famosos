import 'package:app_famosos/src/models/famoso_modelo.dart';

import 'package:flutter/material.dart';

class ItemFamosos extends StatelessWidget {
  final FamosoModelo famosos;
  const ItemFamosos({
    super.key,
    required this.famosos,
  });

  @override
  Widget build(BuildContext context) {
    Color tipoColor = Colors.black;

    if (famosos.genero == "M") {
      tipoColor = Colors.blue;
    } else if (famosos.genero == "F") {
      tipoColor = Colors.pink;
    }

    return Card(
      child: ListTile(
        title: Text(famosos.nombre),
        subtitle: Text(
          famosos.tipo,
          style: TextStyle(color: tipoColor),
        ),
      ),
    );
  }
}
