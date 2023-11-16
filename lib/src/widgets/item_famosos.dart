import 'package:app_famosos/src/controller/famosos_list.dart';
import 'package:app_famosos/src/models/famoso_modelo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemFamoso extends StatelessWidget {
  final FamosoModelo famoso;
  const ItemFamoso({
    Key? key,
    required this.famoso,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final FamososListController ctrFamosos = Get.find();
    return Card(
      child: ListTile (

      ),
    );
  }
}
