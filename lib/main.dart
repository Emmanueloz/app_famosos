import 'package:app_famosos/page/form_famoso.dart';
import 'package:app_famosos/page/famosos_page.dart';
import 'package:app_famosos/page/form_pelicula.dart';
import 'package:app_famosos/page/peliculas_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Material App',
      theme: ThemeData(primaryColor: Colors.blue),
      debugShowCheckedModeBanner: false,
      initialRoute: "/home",
      getPages: [
        GetPage(name: "/home", page: () => const FamososPage()),
        GetPage(name: "/agregarFamoso", page: () => const FormFamososPage()),
        GetPage(name: "/premios", page: () => const MoviePage()),
        GetPage(name: "/agregarPremios", page: () => const FormMoviePage()),
      ],
    );
  }
}
