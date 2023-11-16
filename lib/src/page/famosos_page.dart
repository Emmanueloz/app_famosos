import 'package:app_famosos/src/controller/famosos_list.dart';
import 'package:app_famosos/src/page/form_famoso.dart';
import 'package:app_famosos/src/widgets/item_famosos.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FamososPage extends StatelessWidget {
  FamososPage({super.key});

  final FamososListController ctr = Get.put(FamososListController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Lista de Famosos'),
        ),
        body: Obx(
          () => ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: ctr.listFamosos.length,
            itemBuilder: (BuildContext context, int index) {
              var famosos = ctr.listFamosos[index];
              return ItemFamosos(famosos: famosos);
            },
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => Get.to(() => const FormFamososPage()),
          child: const Icon(Icons.add),
        ));
  }
}
