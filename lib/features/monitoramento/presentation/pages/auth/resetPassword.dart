import 'package:flutter/material.dart';

class ResetPasswordPage extends StatelessWidget {
  const ResetPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    const darkGreen = Color(0xFF1B5E20);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Redefinir Senha', style: TextStyle(color: Colors.white)),
        backgroundColor: darkGreen,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: const Center(
        child: Text('Tela de redefinição de senha (em construção)'),
      ),
    );
  }
}