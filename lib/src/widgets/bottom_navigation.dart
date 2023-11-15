import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomNav extends StatelessWidget {
  final List<BottomNavigationBarItem> items = const [
    BottomNavigationBarItem(
      icon: Icon(Icons.home),
      label: "Famosos",
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.movie),
      label: "Películas",
    ),
  ];

  final PageController pageController;

  const BottomNav({super.key, required this.pageController});

  void onTap(int index) {
    pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: items,
      onTap: onTap,
    );
  }
}
