import 'package:flutter/material.dart';
import '../widgets/bottomNavBar.dart';

class RecordingsPage extends StatelessWidget {
  const RecordingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
            'Gravações',
            style: TextStyle(color: Colors.white),
          ),
      ),
      body: const Center(child: Text('Lista de gravações (simulada)')),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}

