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

  InputDecoration _inputDecoration(String label, IconData icon) {
    const darkGreen = Color(0xFF1B5E20);
    return InputDecoration(
      labelText: label,
      labelStyle: const TextStyle(color: darkGreen),
      prefixIcon: Icon(icon, color: darkGreen),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: darkGreen),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<RegistrationProvider>(context);
    const darkGreen = Color(0xFF1B5E20);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastro - Câmeras', style: TextStyle(color: Colors.white)),
        backgroundColor: darkGreen,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              LinearProgressIndicator(value: 0.66, backgroundColor: Colors.grey[300], color: darkGreen),
              const SizedBox(height: 24),
              Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                elevation: 2,
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          controller: _nameCtrl,
                          decoration: _inputDecoration('Nome da câmera', Icons.videocam),
                          validator: (v) => (v == null || v.isEmpty) ? 'Informe o nome da câmera' : null,
                        ),
                        const SizedBox(height: 16),
                        TextFormField(
                          controller: _idCtrl,
                          decoration: _inputDecoration('Número de identificação', Icons.confirmation_number),
                          validator: (v) => (v == null || v.isEmpty) ? 'Informe o número de identificação' : null,
                        ),
                        const SizedBox(height: 16),
                        TextFormField(
                          controller: _ipCtrl,
                          decoration: _inputDecoration('Endereço IP', Icons.wifi),
                          validator: (v) => (v == null || v.isEmpty) ? 'Informe o IP' : null,
                        ),
                        const SizedBox(height: 16),
                        TextFormField(
                          controller: _noteCtrl,
                          decoration: _inputDecoration('Observações (opcional)', Icons.note_alt),
                        ),
                        const SizedBox(height: 24),
                        Row(
                          children: [
                            Expanded(
                              child: ElevatedButton.icon(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: darkGreen,
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                                  padding: const EdgeInsets.symmetric(vertical: 16),
                                ),
                                icon: const Icon(Icons.add, color: Colors.white),
                                label: const Text('Adicionar câmera', style: TextStyle(color: Colors.white)),
                                onPressed: () {
                                  if (_formKey.currentState?.validate() ?? false) {
                                    final cam = CameraModel(
                                      name: _nameCtrl.text.trim(),
                                      identifier: _idCtrl.text.trim(),
                                      ip: _ipCtrl.text.trim(),
                                      note: _noteCtrl.text.trim(),
                                    );
                                    prov.addCamera(cam);
                                    _nameCtrl.clear();
                                    _idCtrl.clear();
                                    _ipCtrl.clear();
                                    _noteCtrl.clear();
                                  }
                                },
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: ElevatedButton.icon(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.grey,
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                                  padding: const EdgeInsets.symmetric(vertical: 16),
                                ),
                                icon: const Icon(Icons.clear, color: Colors.white),
                                label: const Text('Limpar', style: TextStyle(color: Colors.white)),
                                onPressed: () {
                                  _nameCtrl.clear();
                                  _idCtrl.clear();
                                  _ipCtrl.clear();
                                  _noteCtrl.clear();
                                },
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              const Divider(),
              const SizedBox(height: 8),
              const Text('Câmeras adicionadas:', style: TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: prov.registration.cameras.length,
                itemBuilder: (context, idx) {
                  final cam = prov.registration.cameras[idx];
                  return Card(
                    margin: const EdgeInsets.only(bottom: 12),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    child: ListTile(
                      leading: const Icon(Icons.videocam, color: darkGreen, size: 36),
                      title: Text(cam.name),
                      subtitle: Text('${cam.identifier} • ${cam.ip}'),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete_forever, color: Colors.red),
                        onPressed: () => prov.removeCamera(cam.id),
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: darkGreen,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                  icon: const Icon(Icons.arrow_forward, color: Colors.white),
                  label: const Text('Prosseguir', style: TextStyle(color: Colors.white)),
                  onPressed: () {
                    Navigator.pushNamed(context, '/register/step3');
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}