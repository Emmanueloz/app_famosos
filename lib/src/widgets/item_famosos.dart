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
    return Card(
      child: ListTile(
        title: Text(famosos.nombre),
      ),
    );
  }
}
