import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// Clase para colocar los botones de navegación
/// Se encarga de poder moverse entre las dos paginas y el cambio del icono activo
class BottomNav extends StatelessWidget {
  final PageController pageController;
  final RxInt currentIndex = 0.obs;

  // BottomNav({super.key, required this.pageController});
  BottomNav({super.key, required this.pageController}) {
    pageController.addListener(() {
      currentIndex.value = pageController.page?.round() ?? 0;
    });
  }
  void onTap(int index) {
    currentIndex.value = index;
    pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.face),
            label: "Famosos",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.movie),
            label: "Películas",
          ),
        ],
        currentIndex: currentIndex.value,
        onTap: onTap,
      );
    });
  }
}
