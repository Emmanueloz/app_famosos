import 'package:app_famosos/src/page/famosos_page.dart';
import 'package:app_famosos/src/page/form_famoso.dart';
import 'package:app_famosos/src/page/form_pelicula.dart';
import 'package:app_famosos/src/page/peliculas_page.dart';
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
        GetPage(name: "/peliculas", page: () => const PeliculasPage()),
        GetPage(name: "/agregarPeliculas", page: () => const FormMoviePage()),
      ],
    );
  }
}
