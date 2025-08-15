import 'package:flutter/material.dart';
import 'package:frontend_tcc/providers/registrationProvider.dart';
import 'package:provider/provider.dart';
import '../widgets/bottomNavBar.dart';
import 'package:intl/intl.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    const darkGreen = Color(0xFF1B5E20);
    final prov = Provider.of<RegistrationProvider>(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Meus dispositivos'), backgroundColor: darkGreen),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: prov.registration.cameras.isEmpty
            ? Column(
                children: [
                  const Text('Nenhuma câmera cadastrada', style: TextStyle(fontSize: 16)),
                  const SizedBox(height: 12),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: darkGreen),
                    onPressed: () => Navigator.pushNamed(context, '/register/step4'),
                    child: const Text('Adicionar Câmera'),
                  ),
                ],
              )
            : ListView.builder(
                itemCount: prov.registration.cameras.length,
                itemBuilder: (context, idx) {
                  final cam = prov.registration.cameras[idx];
                  return Card(
                    margin: const EdgeInsets.only(bottom: 12),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    child: ListTile(
                      leading: Container(
                        width: 80,
                        height: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.black12,
                          image: const DecorationImage(
                            image: AssetImage('assets/images/example_camera_frame.jpg'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      title: Text(cam.name),
                      subtitle: Text('${cam.identifier} • ${cam.ip}\nAtualizado em ${DateFormat('dd/MM/yyyy HH:mm').format(DateTime.now())}'),
                      isThreeLine: true,
                      onTap: () {
                        // abrir visualização
                      },
                    ),
                  );
                },
              ),
      ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}
