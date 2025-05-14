import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Início'),
        BottomNavigationBarItem(icon: Icon(Icons.camera), label: 'Câmera'),
        BottomNavigationBarItem(icon: Icon(Icons.video_library), label: 'Gravações'),
        BottomNavigationBarItem(icon: Icon(Icons.notifications), label: 'Notificações'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Perfil'),
        BottomNavigationBarItem(icon: Icon(Icons.more_horiz), label: 'Mais'),
      ],
      onTap: (index) {
        switch (index) {
          case 0:
            Navigator.pushReplacementNamed(context, '/home');
            break;
          case 1:
            Navigator.pushReplacementNamed(context, '/camera');
            break;
          case 2:
            Navigator.pushReplacementNamed(context, '/gravacoes');
            break;
          case 3:
            Navigator.pushReplacementNamed(context, '/notificacoes');
            break;
          case 4:
            Navigator.pushReplacementNamed(context, '/perfil');
            break;
          case 5:
            Navigator.pushReplacementNamed(context, '/mais');
            break;
        }
      },
    );
  }
}
