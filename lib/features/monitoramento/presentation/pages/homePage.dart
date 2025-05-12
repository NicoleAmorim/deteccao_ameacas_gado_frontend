import 'package:flutter/material.dart';
import '../widgets/bottomNavBar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('Tela Inicial')),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}