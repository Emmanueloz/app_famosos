import 'package:app_famosos/src/controller/famosos_list.dart';
import 'package:app_famosos/src/page/form_famoso.dart';
import 'package:app_famosos/src/widgets/item_famosos.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FamososPage extends StatelessWidget {
  FamososPage({super.key});

  final FamososListController ctr = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Lista de Famosos'),
        ),
        body: Obx(
        () => ListView.builder(
          scrollDirection: Axis.vertical,   
          itemCount: ctr.listaFamosos .length,
          itemBuilder: (BuildContext context, int index) {
            var famoso = ctr.listaFamosos[index];
            return ItemFamoso(famoso: famoso);
          },
        ),
      ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => Get.to(const FormFamososPage()),
          child: const Icon(Icons.add),
        ));
  }
}
