import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    const darkGreen = Color(0xFF1B5E20);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sobre o App', style: TextStyle(color: Colors.white)),
        backgroundColor: darkGreen,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          elevation: 2,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: const [
                Icon(Icons.info_outline, color: darkGreen, size: 48),
                SizedBox(height: 16),
                Text(
                  'Monitoramento de Gado\n\nEste aplicativo permite o monitoramento inteligente do seu rebanho, com detecção de ameaças, notificações em tempo real e integração com câmeras de segurança.\n\nVersão 1.0.0',
                  style: TextStyle(fontSize: 16, color: darkGreen),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}