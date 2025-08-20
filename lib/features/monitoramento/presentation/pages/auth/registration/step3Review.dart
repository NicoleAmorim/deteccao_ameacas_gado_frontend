import 'package:flutter/material.dart';
import 'package:frontend_tcc/providers/registrationProvider.dart';
import 'package:provider/provider.dart';

class RegisterStep3Review extends StatelessWidget {
  const RegisterStep3Review({super.key});

  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<RegistrationProvider>(context);
    const darkGreen = Color(0xFF1B5E20);
    final reg = prov.registration;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Revisão do cadastro', style: TextStyle(color: Colors.white)),
        backgroundColor: darkGreen,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            LinearProgressIndicator(value: 1.0, backgroundColor: Colors.grey[300], color: darkGreen),
            const SizedBox(height: 16),
            Expanded(
              child: ListView(
                children: [
                  const Text('Dados pessoais', style: TextStyle(fontWeight: FontWeight.bold)),
                  ListTile(leading: const Icon(Icons.person), title: const Text('Nome'), subtitle: Text(reg.fullName)),
                  ListTile(leading: const Icon(Icons.badge), title: const Text('CPF'), subtitle: Text(reg.cpf)),
                  ListTile(leading: const Icon(Icons.phone), title: const Text('Telefone'), subtitle: Text(reg.phone)),
                  ListTile(leading: const Icon(Icons.email), title: const Text('E-mail'), subtitle: Text(reg.email)),
                  const Divider(),
                  const Text('Endereço', style: TextStyle(fontWeight: FontWeight.bold)),
                  ListTile(leading: const Icon(Icons.location_on), title: const Text('CEP'), subtitle: Text(reg.cep)),
                  ListTile(leading: const Icon(Icons.map), title: const Text('Rua'), subtitle: Text(reg.street)),
                  ListTile(leading: const Icon(Icons.home_work), title: const Text('Número'), subtitle: Text(reg.number)),
                  ListTile(leading: const Icon(Icons.apartment), title: const Text('Bairro'), subtitle: Text(reg.neighborhood)),
                  ListTile(leading: const Icon(Icons.location_city), title: const Text('Cidade'), subtitle: Text(reg.city)),
                  ListTile(leading: const Icon(Icons.flag), title: const Text('UF'), subtitle: Text(reg.uf)),
                  const Divider(),
                  const Text('Câmeras', style: TextStyle(fontWeight: FontWeight.bold)),
                  ...reg.cameras.map((c) => ListTile(
                        leading: const Icon(Icons.videocam),
                        title: Text(c.name),
                        subtitle: Text('${c.identifier} • ${c.ip}'),
                      )),
                  if (reg.cameras.isEmpty)
                    const ListTile(
                      leading: Icon(Icons.info_outline),
                      title: Text('Nenhuma câmera cadastrada'),
                    ),
                ],
              ),
            ),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(backgroundColor: darkGreen),
              icon: const Icon(Icons.check, color: Colors.white),
              label: prov.loading
                  ? const SizedBox(width: 24, height: 24, child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2))
                  : const Text('Concluir cadastro', style: TextStyle(color: Colors.white)),
              onPressed: () async {
                await prov.saveToPrefs();
                Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
              },
            ),
            const SizedBox(height: 12),
          ],
        ),
      ),
    );
  }
}