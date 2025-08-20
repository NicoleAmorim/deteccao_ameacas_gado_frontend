import 'package:flutter/material.dart';
import '../widgets/bottomNavBar.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    const darkGreen = Color(0xFF1B5E20);

    // Simulação de notificações
    final notifications = [
      {
        'title': 'Movimento suspeito detectado',
        'desc': 'Foi detectado um movimento suspeito na câmera 1.',
        'date': '20/08/2025 14:32'
      },
      {
        'title': 'Animal fora do cercado',
        'desc': 'A câmera 2 detectou um animal fora do cercado.',
        'date': '19/08/2025 22:10'
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Notificações', style: TextStyle(color: Colors.white)),
        backgroundColor: darkGreen,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: notifications.isEmpty
            ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.notifications_off, size: 64, color: Colors.grey),
                    const SizedBox(height: 16),
                    const Text('Nenhuma notificação encontrada', style: TextStyle(fontSize: 18, color: darkGreen, fontWeight: FontWeight.bold)),
                  ],
                ),
              )
            : ListView.separated(
                itemCount: notifications.length,
                separatorBuilder: (_, __) => const SizedBox(height: 16),
                itemBuilder: (context, idx) {
                  final notif = notifications[idx];
                  return Card(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    child: ListTile(
                      leading: const Icon(Icons.warning_amber_rounded, color: Colors.orange, size: 36),
                      title: Text(notif['title']!, style: const TextStyle(fontWeight: FontWeight.bold)),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(notif['desc']!),
                          const SizedBox(height: 4),
                          Text(notif['date']!, style: const TextStyle(fontSize: 12, color: Colors.grey)),
                        ],
                      ),
                    ),
                  );
                },
              ),
      ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}