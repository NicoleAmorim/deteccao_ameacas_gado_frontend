import 'package:flutter/material.dart';

class SupportPage extends StatelessWidget {
  const SupportPage({super.key});

  @override
  Widget build(BuildContext context) {
    const darkGreen = Color(0xFF1B5E20);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Suporte', style: TextStyle(color: Colors.white)),
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
              children: [
                const Icon(Icons.support_agent, color: darkGreen, size: 48),
                const SizedBox(height: 16),
                const Text(
                  'Assim como explicado na aquisição de nosso equipamento e serviço, se houver necessidade de alteração do seu plano, solicite o suporte técnico via e-mail.\n\n*Mediante a taxa de suporte combinada.',
                  style: TextStyle(fontSize: 16, color: darkGreen),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 24),
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: darkGreen,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
                  ),
                  icon: const Icon(Icons.email, color: Colors.white),
                  label: const Text('Enviar e-mail para suporte', style: TextStyle(color: Colors.white)),
                  onPressed: () {
                    // Futuro: abrir app de e-mail
                  },
                ),
                const SizedBox(height: 8),
                const Text(
                  'suporte@monitoramentogado.com',
                  style: TextStyle(color: darkGreen, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}