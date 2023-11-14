import 'package:flutter/material.dart';

const _kPages = <String>["home", "premios"];

class BottomNav extends StatelessWidget {
  const BottomNav({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: "Home",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.percent),
          label: "Premios",
        ),
      ],
      onTap: (value) {
        print(_kPages[value]);
      },
    );
  }
}
