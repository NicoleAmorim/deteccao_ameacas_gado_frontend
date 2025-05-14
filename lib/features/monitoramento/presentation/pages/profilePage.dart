import 'package:flutter/material.dart';
import '../widgets/bottomNavBar.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    const darkGreen = Color(0xFF1B5E20);

    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text(
          'Perfil',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: darkGreen,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              // Foto e nome do dispositivo
              Row(
                children: [
                  const CircleAvatar(
                    radius: 35,
                    backgroundImage: AssetImage('assets/images/icon_logo.png'),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'iMX C-85CD',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'Dispositivo ativo',
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.more_vert),
                  ),
                ],
              ),
              const SizedBox(height: 32),

              // Informações básicas (CPF, telefone, senha)
              _buildInfoTile('Nome completo', 'João da Silva'),
              _buildInfoTile('CPF', '000.000.000-00'),
              _buildInfoTile('Telefone', '(11) 91234-5678'),
              _buildInfoTile('Senha', '••••••••'),

              const SizedBox(height: 32),

              // Botão de redirecionamento para planos
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/meus-planos');
                },
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: darkGreen,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Center(
                    child: Text(
                      'Meus Planos',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }

  Widget _buildInfoTile(String label, String value) {
    return Column(
      children: [
        ListTile(
          title: Text(label),
          subtitle: Text(value),
          trailing: const Icon(Icons.chevron_right),
          onTap: () {},
        ),
        const Divider(),
      ],
    );
  }
}
