import 'package:flutter/material.dart';
import 'package:get/get.dart';

const _kPages = <String>["home", "premios"];

class BottomNav extends StatelessWidget {
  const BottomNav({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: "Famosos",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.movie),
          label: "Películas",
        ),
      ],
      onTap: (value) {
        print(_kPages[value]);
        Get.offNamed(_kPages[value]);
      },
    );
  }
}
