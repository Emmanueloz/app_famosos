import 'package:app_famosos/src/page/form_famoso.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FamososPage extends StatelessWidget {
  const FamososPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Famosos'),
        ),
        body: const Center(
          child: Text('Famosos'),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => Get.to(const FormFamososPage()),
          child: const Icon(Icons.add),
        ));
  }
}
