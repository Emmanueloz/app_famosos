import 'package:app_famosos/src/page/famosos_page.dart';
import 'package:app_famosos/src/page/form_famoso.dart';
import 'package:app_famosos/src/page/form_pelicula.dart';
import 'package:app_famosos/src/page/peliculas_page.dart';
import 'package:app_famosos/src/widgets/bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: HomeScreen(),
      getPages: [
        GetPage(name: '/famosos', page: () => const FamososPage()),
        GetPage(name: '/formFamoso', page: () => const FormFamososPage()),
        GetPage(name: '/peliculas', page: () => const PeliculasPage()),
        GetPage(name: '/formPeliculas', page: () => FormPeliculasPage()),
      ],
    );
  }
}

class HomeScreen extends StatelessWidget {
  final PageController _pageController = PageController();

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: const [
          FamososPage(),
          PeliculasPage(),
        ],
      ),
      bottomNavigationBar: BottomNav(pageController: _pageController),
    );
  }
}
