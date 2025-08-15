import 'package:flutter/material.dart';
import 'package:frontend_tcc/providers/registrationProvider.dart';
import 'package:provider/provider.dart';

class RegisterStep4Review extends StatelessWidget {
  const RegisterStep4Review({super.key});

  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<RegistrationProvider>(context);
    const darkGreen = Color(0xFF1B5E20);
    final reg = prov.registration;

    return Scaffold(
      appBar: AppBar(title: const Text('Revisão do cadastro'), backgroundColor: darkGreen),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            LinearProgressIndicator(value: 1.0, backgroundColor: Colors.grey[300], color: darkGreen),
            const SizedBox(height: 16),
            Expanded(
              child: ListView(
                children: [
                  const Text('Dados pessoais', style: TextStyle(fontWeight: FontWeight.bold)),
                  ListTile(title: Text('Nome'), subtitle: Text(reg.fullName)),
                  ListTile(title: Text('Telefone'), subtitle: Text(reg.phone)),
                  ListTile(title: Text('E-mail'), subtitle: Text(reg.email)),
                  ListTile(title: Text('Endereço'), subtitle: Text(reg.address)),
                  const Divider(),
                  const Text('Plano', style: TextStyle(fontWeight: FontWeight.bold)),
                  ListTile(title: Text('Selecionado'), subtitle: Text(reg.plan)),
                  const Divider(),
                  const Text('Pagamento', style: TextStyle(fontWeight: FontWeight.bold)),
                  ListTile(title: Text('Titular'), subtitle: Text(reg.cardHolderName)),
                  ListTile(title: Text('Cartão (últimos 4)'), subtitle: Text(reg.cardNumber.length >= 4 ? reg.cardNumber.substring(reg.cardNumber.length-4) : reg.cardNumber)),
                  const Divider(),
                  const Text('Câmeras', style: TextStyle(fontWeight: FontWeight.bold)),
                  ...reg.cameras.map((c) => ListTile(title: Text(c.name), subtitle: Text('${c.identifier} • ${c.ip}'))).toList(),
                  const SizedBox(height: 16),
                ],
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: darkGreen),
              onPressed: () async {
                await prov.saveToPrefs();
                // Aqui você pode enviar para API quando estiver pronta
                Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
              },
              child: prov.loading ? const CircularProgressIndicator(color: Colors.white) : const Text('Concluir cadastro'),
            ),
            const SizedBox(height: 12),
          ],
        ),
      ),
    );
  }
}
