import 'package:flutter/material.dart';
import 'package:frontend_tcc/features/monitoramento/data/models/cameraModel.dart';
import 'package:frontend_tcc/providers/registrationProvider.dart';
import 'package:provider/provider.dart';

class RegisterStep2Camera extends StatefulWidget {
  const RegisterStep2Camera({super.key});

  @override
  State<RegisterStep2Camera> createState() => _RegisterStep2CameraState();
}

class _RegisterStep2CameraState extends State<RegisterStep2Camera> {
  final _formKey = GlobalKey<FormState>();
  final _nameCtrl = TextEditingController();
  final _idCtrl = TextEditingController();
  final _ipCtrl = TextEditingController();
  final _noteCtrl = TextEditingController();

  @override
  void dispose() {
    _nameCtrl.dispose();
    _idCtrl.dispose();
    _ipCtrl.dispose();
    _noteCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<RegistrationProvider>(context);
    const darkGreen = Color(0xFF1B5E20);

    return Scaffold(
      appBar: AppBar(title: const Text('Cadastro - Registrar câmeras'), backgroundColor: darkGreen),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            LinearProgressIndicator(value: 0.66, backgroundColor: Colors.grey[300], color: darkGreen),
            const SizedBox(height: 12),
            Expanded(
              child: Column(
                children: [
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        TextFormField(controller: _nameCtrl, decoration: const InputDecoration(labelText: 'Nome da câmera')),
                        const SizedBox(height: 12),
                        TextFormField(controller: _idCtrl, decoration: const InputDecoration(labelText: 'Número de identificação')),
                        const SizedBox(height: 12),
                        TextFormField(controller: _ipCtrl, decoration: const InputDecoration(labelText: 'Endereço IP')),
                        const SizedBox(height: 12),
                        TextFormField(controller: _noteCtrl, decoration: const InputDecoration(labelText: 'Observações (opcional)')),
                        const SizedBox(height: 12),
                        Row(
                          children: [
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(backgroundColor: darkGreen),
                              onPressed: () {
                                if (_nameCtrl.text.isEmpty || _idCtrl.text.isEmpty || _ipCtrl.text.isEmpty) {
                                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Preencha os campos obrigatórios')));
                                  return;
                                }
                                final cam = CameraModel(name: _nameCtrl.text.trim(), identifier: _idCtrl.text.trim(), ip: _ipCtrl.text.trim(), note: _noteCtrl.text.trim());
                                prov.addCamera(cam);
                                _nameCtrl.clear();
                                _idCtrl.clear();
                                _ipCtrl.clear();
                                _noteCtrl.clear();
                              },
                              child: const Text('Adicionar câmera'),
                            ),
                            const SizedBox(width: 12),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(backgroundColor: Colors.grey),
                              onPressed: () {
                                // limpar
                                _nameCtrl.clear();
                                _idCtrl.clear();
                                _ipCtrl.clear();
                                _noteCtrl.clear();
                              },
                              child: const Text('Limpar'),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Divider(),
                  const SizedBox(height: 8),
                  const Text('Câmeras adicionadas:'),
                  const SizedBox(height: 8),
                  Expanded(
                    child: ListView.builder(
                      itemCount: prov.registration.cameras.length,
                      itemBuilder: (context, idx) {
                        final cam = prov.registration.cameras[idx];
                        return ListTile(
                          title: Text(cam.name),
                          subtitle: Text('${cam.identifier} • ${cam.ip}'),
                          trailing: IconButton(
                            icon: const Icon(Icons.delete_forever, color: Colors.red),
                            onPressed: () => prov.removeCamera(cam.id),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: darkGreen),
              onPressed: () {
                if (prov.registration.cameras.isEmpty) {
                  // ask confirm skip
                  showDialog(
                    context: context,
                    builder: (_) => AlertDialog(
                      title: const Text('Nenhuma câmera adicionada'),
                      content: const Text('Deseja prosseguir sem adicionar câmeras?'),
                      actions: [
                        TextButton(onPressed: () => Navigator.pop(context), child: const Text('Voltar')),
                        TextButton(onPressed: () {
                          Navigator.pop(context);
                          Navigator.pushNamed(context, '/register/step5');
                        }, child: const Text('Prosseguir')),
                      ],
                    ),
                  );
                } else {
                  Navigator.pushNamed(context, '/register/step3');
                }
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
