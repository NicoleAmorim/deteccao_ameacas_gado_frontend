import 'package:flutter/material.dart';
import 'package:frontend_tcc/providers/registrationProvider.dart';
import 'package:provider/provider.dart';

class RegisterStep1Personal extends StatefulWidget {
  const RegisterStep1Personal({super.key});

  @override
  State<RegisterStep1Personal> createState() => _RegisterStep1PersonalState();
}

class _RegisterStep1PersonalState extends State<RegisterStep1Personal> {
  final _formKey = GlobalKey<FormState>();
  final _fullNameCtrl = TextEditingController();
  final _phoneCtrl = TextEditingController();
  final _emailCtrl = TextEditingController();
  final _passwordCtrl = TextEditingController();
  final _confirmCtrl = TextEditingController();
  final _addressCtrl = TextEditingController();

  @override
  void dispose() {
    _fullNameCtrl.dispose();
    _phoneCtrl.dispose();
    _emailCtrl.dispose();
    _passwordCtrl.dispose();
    _confirmCtrl.dispose();
    _addressCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<RegistrationProvider>(context, listen: false);
    const darkGreen = Color(0xFF1B5E20);

    return Scaffold(
      appBar: AppBar(title: const Text('Cadastro - Dados pessoais'), backgroundColor: darkGreen),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            LinearProgressIndicator(value: 0.16, backgroundColor: Colors.grey[300], color: darkGreen),
            const SizedBox(height: 16),
            Expanded(
              child: Form(
                key: _formKey,
                child: ListView(
                  children: [
                    TextFormField(
                      controller: _fullNameCtrl,
                      decoration: const InputDecoration(labelText: 'Nome completo'),
                      validator: (v) => (v == null || v.isEmpty) ? 'Informe o nome' : null,
                    ),
                    const SizedBox(height: 12),
                    TextFormField(
                      controller: _phoneCtrl,
                      decoration: const InputDecoration(labelText: 'Número de celular'),
                      keyboardType: TextInputType.phone,
                      validator: (v) => (v == null || v.isEmpty) ? 'Informe o telefone' : null,
                    ),
                    const SizedBox(height: 12),
                    TextFormField(
                      controller: _emailCtrl,
                      decoration: const InputDecoration(labelText: 'E-mail'),
                      keyboardType: TextInputType.emailAddress,
                      validator: (v) => (v == null || !v.contains('@')) ? 'E-mail inválido' : null,
                    ),
                    const SizedBox(height: 12),
                    TextFormField(
                      controller: _passwordCtrl,
                      decoration: const InputDecoration(labelText: 'Senha'),
                      obscureText: true,
                      validator: (v) => (v == null || v.length < 6) ? 'Senha muito curta' : null,
                    ),
                    const SizedBox(height: 12),
                    TextFormField(
                      controller: _confirmCtrl,
                      decoration: const InputDecoration(labelText: 'Confirmar senha'),
                      obscureText: true,
                      validator: (v) => (v != _passwordCtrl.text) ? 'Senhas não conferem' : null,
                    ),
                    const SizedBox(height: 12),
                    TextFormField(
                      controller: _addressCtrl,
                      decoration: const InputDecoration(labelText: 'Endereço'),
                      validator: (v) => (v == null || v.isEmpty) ? 'Informe o endereço' : null,
                    ),
                  ],
                ),
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: darkGreen),
              onPressed: () {
                if (_formKey.currentState?.validate() ?? false) {
                  prov.updatePersonal(
                    fullName: _fullNameCtrl.text.trim(),
                    phone: _phoneCtrl.text.trim(),
                    email: _emailCtrl.text.trim(),
                    password: _passwordCtrl.text,
                    address: _addressCtrl.text.trim(),
                  );
                  Navigator.pushNamed(context, '/register/step2');
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
