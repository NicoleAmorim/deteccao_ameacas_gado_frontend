import 'package:flutter/material.dart';
import '../widgets/bottomNavBar.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    const Color darkGreen = Color(0xFF1B5E20); // Verde escuro personalizado

    return Scaffold(
      appBar: AppBar(
        title: const Text('Perfil do Usuário',
          style: TextStyle(
            color: Colors.white, // cor do texto
          ),
        ),
        backgroundColor: darkGreen,
        
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Foto de perfil com botão de edição
            Center(
              child: Stack(
                alignment: Alignment.bottomRight,
                children: [
                  const CircleAvatar(
                    radius: 60,
                    backgroundImage: AssetImage('assets/images/icon_logo.png'), // imagem padrão
                  ),
                  Positioned(
                    child: Container(
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: darkGreen,
                      ),
                      child: IconButton(
                        icon: const Icon(Icons.edit, color: Colors.white, size: 20),
                        onPressed: () {
                          // Ação de editar foto
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),

            // Campos de dados
            _buildProfileField(label: 'Nome completo', hint: 'João da Silva'),
            const SizedBox(height: 16),
            _buildProfileField(label: 'CPF', hint: '000.000.000-00'),
            const SizedBox(height: 16),
            _buildProfileField(label: 'Telefone', hint: '(11) 91234-5678'),
            const SizedBox(height: 16),
            _buildProfileField(label: 'Senha', hint: '••••••••', obscureText: true),
            const SizedBox(height: 16),
            _buildProfileField(label: 'Plano da câmera', hint: 'Mensal - R\$ 29,90'),
            const SizedBox(height: 32),

            // Botão de salvar
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: darkGreen,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {
                  // Salvar dados do perfil
                },
                child: const Text(
                  'Salvar Alterações',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }

  // Componente reutilizável para os campos de texto
  Widget _buildProfileField({
    required String label,
    required String hint,
    bool obscureText = false,
  }) {
    return TextField(
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}
