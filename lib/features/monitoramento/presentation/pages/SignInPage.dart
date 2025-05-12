import 'package:flutter/material.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Adicionar Perfil')),
      body: const Center(child: Text('Formulário fake para adicionar perfil')),
    );
  }
}