import 'package:flutter/material.dart';
import '../widgets/bottomNavBar.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Notificações',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: const Center(child: Text('Lista de notificações (simulada)')),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}