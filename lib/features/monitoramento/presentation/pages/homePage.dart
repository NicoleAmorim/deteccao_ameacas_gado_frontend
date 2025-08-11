import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../widgets/bottomNavBar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    const Color darkGreen = Color(0xFF1B5E20);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: darkGreen,
        title: const Text(
          'Minha casa',
          style: TextStyle(color: Colors.white),
        ),
        actions: const [
          Icon(Icons.search, color: Colors.white),
          SizedBox(width: 12),
          Icon(Icons.add, color: Colors.white),
          SizedBox(width: 16),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            
            const SizedBox(height: 16),

            // Área "Selecione suas cenas preferidas"
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: const [
                  Icon(Icons.dashboard_customize_outlined, color: darkGreen),
                  SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      'Selecione suas cenas preferidas',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  Icon(Icons.chevron_right),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // Título
            const Text(
              'Meus dispositivos',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 12),

            // Imagem e data/hora
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Miniatura de vídeo/imagem
                Container(
                  width: 120,
                  height: 90,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    image: const DecorationImage(
                      image: AssetImage('assets/images/example_camera_frame.jpeg'), // Substituir pela imagem correta
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(width: 12),

                // Data e hora
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      DateFormat('dd/MM/yyyy').format(DateTime.now()),
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      DateFormat('HH:mm:ss').format(DateTime.now()),
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ],
            ),

            const SizedBox(height: 32),

            // Texto informativo
            Center(
              child: Column(
                children: const [
                  Divider(),
                  SizedBox(height: 8),
                  Text(
                    'Sem mais informações',
                    style: TextStyle(color: Colors.grey),
                  ),
                  SizedBox(height: 8),
                  Divider(),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}
