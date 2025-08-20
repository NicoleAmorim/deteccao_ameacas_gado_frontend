import 'package:flutter/material.dart';
import 'package:frontend_tcc/providers/registrationProvider.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class RegisterStep1Personal extends StatefulWidget {
  const RegisterStep1Personal({super.key});

  @override
  State<RegisterStep1Personal> createState() => _RegisterStep1PersonalState();
}

class _RegisterStep1PersonalState extends State<RegisterStep1Personal> {
  final _formKey = GlobalKey<FormState>();
  final _fullNameCtrl = TextEditingController();
  final _cpfCtrl = TextEditingController();
  final _phoneCtrl = TextEditingController();
  final _emailCtrl = TextEditingController();
  final _passwordCtrl = TextEditingController();
  final _confirmCtrl = TextEditingController();
  final _cepCtrl = TextEditingController();
  final _streetCtrl = TextEditingController();
  final _numberCtrl = TextEditingController();
  final _neighborhoodCtrl = TextEditingController();
  final _cityCtrl = TextEditingController();
  final _ufCtrl = TextEditingController();

  @override
  void dispose() {
    _fullNameCtrl.dispose();
    _cpfCtrl.dispose();
    _phoneCtrl.dispose();
    _emailCtrl.dispose();
    _passwordCtrl.dispose();
    _confirmCtrl.dispose();
    _cepCtrl.dispose();
    _streetCtrl.dispose();
    _numberCtrl.dispose();
    _neighborhoodCtrl.dispose();
    _cityCtrl.dispose();
    _ufCtrl.dispose();
    super.dispose();
  }

  Future<void> _buscarEnderecoPorCep(String cep) async {
    final url = Uri.parse('https://viacep.com.br/ws/$cep/json/');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      if (data['erro'] == null) {
        setState(() {
          _streetCtrl.text = data['logradouro'] ?? '';
          _neighborhoodCtrl.text = data['bairro'] ?? '';
          _cityCtrl.text = data['localidade'] ?? '';
          _ufCtrl.text = data['uf'] ?? '';
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<RegistrationProvider>(context, listen: false);
    const darkGreen = Color(0xFF1B5E20);

    InputDecoration _inputDecoration(String label, IconData icon) {
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

    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastro - Dados pessoais', style: TextStyle(color: Colors.white)),
        backgroundColor: darkGreen,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              LinearProgressIndicator(value: 0.33, backgroundColor: Colors.grey[300], color: darkGreen),
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
                          controller: _fullNameCtrl,
                          decoration: _inputDecoration('Nome completo', Icons.person),
                          validator: (v) => (v == null || v.isEmpty) ? 'Informe o nome' : null,
                        ),
                        const SizedBox(height: 16),
                        TextFormField(
                          controller: _cpfCtrl,
                          decoration: _inputDecoration('CPF', Icons.badge),
                          keyboardType: TextInputType.number,
                          validator: (v) => (v == null || v.isEmpty) ? 'Informe o CPF' : null,
                        ),
                        const SizedBox(height: 16),
                        TextFormField(
                          controller: _phoneCtrl,
                          decoration: _inputDecoration('Número de celular', Icons.phone),
                          keyboardType: TextInputType.phone,
                          validator: (v) => (v == null || v.isEmpty) ? 'Informe o telefone' : null,
                        ),
                        const SizedBox(height: 16),
                        TextFormField(
                          controller: _emailCtrl,
                          decoration: _inputDecoration('E-mail', Icons.email),
                          keyboardType: TextInputType.emailAddress,
                          validator: (v) => (v == null || !v.contains('@')) ? 'E-mail inválido' : null,
                        ),
                        const SizedBox(height: 16),
                        TextFormField(
                          controller: _passwordCtrl,
                          decoration: _inputDecoration('Senha', Icons.lock),
                          obscureText: true,
                          validator: (v) => (v == null || v.length < 6) ? 'Senha muito curta' : null,
                        ),
                        const SizedBox(height: 16),
                        TextFormField(
                          controller: _confirmCtrl,
                          decoration: _inputDecoration('Confirmar senha', Icons.lock_outline),
                          obscureText: true,
                          validator: (v) => (v != _passwordCtrl.text) ? 'Senhas não conferem' : null,
                        ),
                        const SizedBox(height: 24),
                        const Divider(),
                        const SizedBox(height: 8),
                        const Text('Endereço', style: TextStyle(fontWeight: FontWeight.bold)),
                        const SizedBox(height: 16),
                        TextFormField(
                          controller: _cepCtrl,
                          decoration: _inputDecoration('CEP', Icons.location_on),
                          keyboardType: TextInputType.number,
                          onChanged: (value) {
                            if (value.length == 8) {
                              _buscarEnderecoPorCep(value);
                            }
                          },
                          validator: (v) => (v == null || v.isEmpty) ? 'Informe o CEP' : null,
                        ),
                        const SizedBox(height: 16),
                        TextFormField(
                          controller: _streetCtrl,
                          decoration: _inputDecoration('Rua', Icons.map),
                          validator: (v) => (v == null || v.isEmpty) ? 'Informe a rua' : null,
                        ),
                        const SizedBox(height: 16),
                        TextFormField(
                          controller: _numberCtrl,
                          decoration: _inputDecoration('Número', Icons.home_work),
                          keyboardType: TextInputType.number,
                          validator: (v) => (v == null || v.isEmpty) ? 'Informe o número' : null,
                        ),
                        const SizedBox(height: 16),
                        TextFormField(
                          controller: _neighborhoodCtrl,
                          decoration: _inputDecoration('Bairro', Icons.apartment),
                          validator: (v) => (v == null || v.isEmpty) ? 'Informe o bairro' : null,
                        ),
                        const SizedBox(height: 16),
                        TextFormField(
                          controller: _cityCtrl,
                          decoration: _inputDecoration('Cidade', Icons.location_city),
                          validator: (v) => (v == null || v.isEmpty) ? 'Informe a cidade' : null,
                        ),
                        const SizedBox(height: 16),
                        TextFormField(
                          controller: _ufCtrl,
                          decoration: _inputDecoration('UF', Icons.flag),
                          validator: (v) => (v == null || v.isEmpty) ? 'Informe o UF' : null,
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
                              if (_formKey.currentState?.validate() ?? false) {
                                prov.updatePersonal(
                                  fullName: _fullNameCtrl.text.trim(),
                                  cpf: _cpfCtrl.text.trim(),
                                  phone: _phoneCtrl.text.trim(),
                                  email: _emailCtrl.text.trim(),
                                  password: _passwordCtrl.text,
                                  cep: _cepCtrl.text.trim(),
                                  street: _streetCtrl.text.trim(),
                                  number: _numberCtrl.text.trim(),
                                  neighborhood: _neighborhoodCtrl.text.trim(),
                                  city: _cityCtrl.text.trim(),
                                  uf: _ufCtrl.text.trim(),
                                );
                                Navigator.pushNamed(context, '/register/step2');
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}