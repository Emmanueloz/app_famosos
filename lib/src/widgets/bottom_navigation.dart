import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomNav extends StatelessWidget {
  final PageController pageController;
  final RxInt currentIndex = 0.obs;

  BottomNav({super.key, required this.pageController});

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
            icon: Icon(Icons.home),
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
