import 'package:app_famosos/widgets/bottom_navigation.dart';
import 'package:flutter/material.dart';

class FamososPage extends StatelessWidget {
  const FamososPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Famosos',
      home: Scaffold(
          appBar: AppBar(
            title: const Text('Famosos'),
          ),
          body: const Center(
            child: Text('Hello World'),
          ),
          bottomNavigationBar: const BottomNav()),
    );
  }
}
