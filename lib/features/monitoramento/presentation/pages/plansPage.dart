import 'package:flutter/material.dart';

class PlansPage extends StatelessWidget {
  const PlansPage({super.key});

  final List<Map<String, String>> planos = const [
    {
      'nome': 'Plano Básico',
      'descricao': 'Monitoramento de 1 câmera',
      'imagem': 'assets/images/example_camera_frame.jpeg',
    },
    {
      'nome': 'Plano Avançado',
      'descricao': 'Até 3 câmeras + alertas',
      'imagem': 'assets/images/example_camera_frame.jpeg',
    },
    {
      'nome': 'Plano Premium',
      'descricao': 'Todas as câmeras + gravação em nuvem',
      'imagem': 'assets/images/example_camera_frame.jpeg',
    },
  ];

  @override
  Widget build(BuildContext context) {
    const darkGreen = Color(0xFF1B5E20);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Meus Planos',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: darkGreen,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: GridView.builder(
          itemCount: planos.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1,
            mainAxisSpacing: 16,
            childAspectRatio: 1.7,
          ),
          itemBuilder: (context, index) {
            final plano = planos[index];
            return Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              elevation: 5,
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.asset(
                      plano['imagem']!,
                      width: double.infinity,
                      height: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: [Colors.black54, Colors.transparent],
                      ),
                    ),
                  ),
                  Positioned(
                    left: 16,
                    bottom: 16,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          plano['nome']!,
                          style: const TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          plano['descricao']!,
                          style: const TextStyle(fontSize: 14, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
