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
        onDismissed: ((direction)=>{
          if (direction == DismissDirection.endToStart)
          {ctrList.delete(famosos)}
        }),
        child: ListTile(
        title: Text(famosos.nombre),
      ),
      )
      
    );
  }
}
