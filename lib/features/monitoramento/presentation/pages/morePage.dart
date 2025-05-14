import 'package:flutter/material.dart';
import '../widgets/bottomNavBar.dart';

class MorePage extends StatelessWidget {
  const MorePage({super.key});

  @override
  Widget build(BuildContext context) {
    const darkGreen = Color(0xFF1B5E20);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Mais'),
        backgroundColor: darkGreen,
      ),
      body: ListView(
        children: [
          ListTile(
            leading: const Icon(Icons.support_agent),
            title: const Text('Suporte'),
            onTap: () {
              // Abre tela de suporte
            },
          ),
          ListTile(
            leading: const Icon(Icons.contact_mail),
            title: const Text('Contato'),
            onTap: () {
              // Abre tela de contato
            },
          ),
          ListTile(
            leading: const Icon(Icons.info_outline),
            title: const Text('Sobre o App'),
            onTap: () {
              // Abre tela de informações
            },
          ),
        ],
      ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}
