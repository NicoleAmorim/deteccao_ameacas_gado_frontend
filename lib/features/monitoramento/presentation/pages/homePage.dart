import 'package:flutter/material.dart';
import 'package:frontend_tcc/providers/registrationProvider.dart';
import 'package:provider/provider.dart';
import '../widgets/bottomNavBar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    const darkGreen = Color(0xFF1B5E20);
    final prov = Provider.of<RegistrationProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Minhas Câmeras', style: TextStyle(color: Colors.white)),
        backgroundColor: darkGreen,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: prov.registration.cameras.isEmpty
            ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.videocam_off, size: 64, color: Colors.grey),
                    const SizedBox(height: 16),
                    const Text('Nenhuma câmera cadastrada', style: TextStyle(fontSize: 18, color: darkGreen, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 16),
                    ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: darkGreen,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
                      ),
                      icon: const Icon(Icons.add, color: Colors.white),
                      label: const Text('Adicionar Câmera', style: TextStyle(color: Colors.white)),
                      onPressed: () => Navigator.pushNamed(context, '/register/step2'),
                    ),
                  ],
                ),
              )
            : ListView(
                children: [
                  ...prov.registration.cameras.map((cam) => Card(
                        margin: const EdgeInsets.only(bottom: 16),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        child: ListTile(
                          leading: const Icon(Icons.videocam, color: darkGreen, size: 36),
                          title: Text(cam.name, style: const TextStyle(fontWeight: FontWeight.bold)),
                          subtitle: Text('${cam.identifier} • ${cam.ip}'),
                          trailing: IconButton(
                            icon: const Icon(Icons.delete_forever, color: Colors.red),
                            onPressed: () => prov.removeCamera(cam.id),
                          ),
                        ),
                      )),
                ],
              ),
      ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}