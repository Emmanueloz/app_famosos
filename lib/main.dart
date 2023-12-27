import 'package:app_famosos/src/controller/famosos_list.dart';
import 'package:app_famosos/src/controller/peliculas_list.dart';
import 'package:app_famosos/src/page/famosos_page.dart';
import 'package:app_famosos/src/page/form_famoso.dart';
import 'package:app_famosos/src/page/form_pelicula.dart';
import 'package:app_famosos/src/page/peliculas_page.dart';
import 'package:app_famosos/src/widgets/bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(FamososListController());
    Get.put(PeliculasListController());
    return GetMaterialApp(
      home: HomeScreen(),
      title: 'App Famosos',
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('es', 'MX'),
      ],
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.indigo,
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        useMaterial3: true,
      ),
      getPages: [
        GetPage(name: '/famosos', page: () => FamososPage()),
        GetPage(name: '/formFamoso', page: () => const FormFamososPage()),
        GetPage(name: '/peliculas', page: () => PeliculasPage()),
        GetPage(name: '/formPeliculas', page: () => const FormPeliculasPage()),
      ],
    );
  }
}

class HomeScreen extends StatelessWidget {
  final PageController _pageController = PageController();

  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: [
          FamososPage(),
          PeliculasPage(),
        ],
      ),
      bottomNavigationBar: BottomNav(pageController: _pageController),
    );
  }
}
