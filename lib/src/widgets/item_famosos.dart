import 'package:app_famosos/src/models/famoso_modelo.dart';
import 'package:flutter/material.dart';


class ItemFamoso extends StatelessWidget {
  final FamosoModelo famoso;
  const ItemFamoso({
    Key? key,
    required this.famoso,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile (
        title: Text(famoso.nombre),
      ),
    );
  }
}
