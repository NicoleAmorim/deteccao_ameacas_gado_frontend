import 'package:flutter/material.dart';
import 'package:frontend_tcc/providers/registrationProvider.dart';
import 'package:provider/provider.dart';

class RegisterStep3Selection extends StatelessWidget {
  const RegisterStep3Selection({super.key});

  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<RegistrationProvider>(context);
    const darkGreen = Color(0xFF1B5E20);
    final cams = prov.registration.cameras;
    final limit = prov.getPlanLimit(prov.registration.plan);

    return Scaffold(
      appBar: AppBar(title: const Text('Cadastro - Seleção de câmeras'), backgroundColor: darkGreen),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            LinearProgressIndicator(value: 0.83, backgroundColor: Colors.grey[300], color: darkGreen),
            const SizedBox(height: 12),
            if (cams.isEmpty) const Text('Nenhuma câmera cadastrada.'),
            Expanded(
              child: ListView.builder(
                itemCount: cams.length,
                itemBuilder: (context, idx) {
                  final c = cams[idx];
                  final selected = prov.registration.selectedCameraIds.contains(c.id);
                  final canSelect = selected || prov.registration.selectedCameraIds.length < limit;
                  return ListTile(
                    leading: const Icon(Icons.videocam),
                    title: Text(c.name),
                    subtitle: Text('${c.identifier} • ${c.ip}'),
                    trailing: Checkbox(
                      value: selected,
                      onChanged: canSelect
                          ? (_) {
                              prov.selectCamera(c.id);
                            }
                          : null,
                    ),
                  );
                },
              ),
            ),
            Text('Limite do plano: $limit câmeras'),
            const SizedBox(height: 12),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: darkGreen),
              onPressed: () {
                Navigator.pushNamed(context, '/register/step4');
              },
              child: const Text('Prosseguir'),
            ),
            const SizedBox(height: 12),
          ],
        ),
      ),
    );
  }
}
