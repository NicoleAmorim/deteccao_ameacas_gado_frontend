import 'package:flutter/material.dart';
import '../widgets/bottomNavBar.dart';

class MorePage extends StatelessWidget {
  const MorePage({super.key});

  @override
  Widget build(BuildContext context) {
    const darkGreen = Color(0xFF1B5E20);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Mais', style: TextStyle(color: Colors.white)),
        backgroundColor: darkGreen,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              elevation: 2,
              child: ListTile(
                leading: const Icon(Icons.support_agent, color: darkGreen),
                title: const Text('Suporte', style: TextStyle(fontWeight: FontWeight.bold)),
                trailing: const Icon(Icons.chevron_right),
                onTap: () => Navigator.pushNamed(context, '/suporte'),
              ),
            ),
            const SizedBox(height: 16),
            Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              elevation: 2,
              child: ListTile(
                leading: const Icon(Icons.contact_mail, color: darkGreen),
                title: const Text('Contato', style: TextStyle(fontWeight: FontWeight.bold)),
                trailing: const Icon(Icons.chevron_right),
                onTap: () => Navigator.pushNamed(context, '/contato'),
              ),
            ),
            const SizedBox(height: 16),
            Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              elevation: 2,
              child: ListTile(
                leading: const Icon(Icons.info_outline, color: darkGreen),
                title: const Text('Sobre o App', style: TextStyle(fontWeight: FontWeight.bold)),
                trailing: const Icon(Icons.chevron_right),
                onTap: () => Navigator.pushNamed(context, '/sobre'),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}