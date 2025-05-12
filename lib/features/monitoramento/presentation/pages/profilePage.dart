import 'package:flutter/material.dart';
import '../widgets/bottomNavBar.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Perfil')),
      body: Center(
        child: ElevatedButton(
          onPressed: () => Navigator.pushNamed(context, '/adicionar-perfil'),
          child: const Text('Adicionar Perfil'),
        ),
      ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}