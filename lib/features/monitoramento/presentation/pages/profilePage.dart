import 'package:flutter/material.dart';
import 'package:frontend_tcc/providers/registrationProvider.dart';
import 'package:provider/provider.dart';
import '../widgets/bottomNavBar.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    const Color darkGreen = Color(0xFF1B5E20);
    final registrationProvider = Provider.of<RegistrationProvider>(context);

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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Foto de perfil com botão de edição
              Center(
                child: Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    const CircleAvatar(
                      radius: 60,
                      backgroundImage:
                          AssetImage('assets/images/icon_logo.png'),
                    ),
                    Container(
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: darkGreen,
                      ),
                      child: IconButton(
                        icon: const Icon(Icons.edit,
                            color: Colors.white, size: 20),
                        onPressed: () {
                          // Futuramente: abrir seleção de imagem
                        },
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              // Nome do dispositivo (fixo por enquanto)
              Row(
                children: [
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'iMX C-85CD',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
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

              // Informações básicas vindas do provider
              _buildInfoTile(
                'Nome completo',
                registrationProvider.registration.fullName.isNotEmpty
                    ? registrationProvider.registration.fullName
                    : 'Não informado',
              ),
              _buildInfoTile(
                'CPF',
                registrationProvider.registration.cpf.isNotEmpty
                    ? registrationProvider.registration.cpf
                    : 'Não informado',
              ),
              _buildInfoTile(
                'Telefone',
                registrationProvider.registration.phone.isNotEmpty
                    ? registrationProvider.registration.phone
                    : 'Não informado',
              ),
              _buildInfoTile(
                'E-mail',
                registrationProvider.registration.email.isNotEmpty
                    ? registrationProvider.registration.email
                    : 'Não informado',
              ),
              _buildInfoTile(
                'CEP',
                registrationProvider.registration.cep.isNotEmpty
                    ? registrationProvider.registration.cep
                    : 'Não informado',
              ),
              _buildInfoTile(
                'Rua',
                registrationProvider.registration.street.isNotEmpty
                    ? registrationProvider.registration.street
                    : 'Não informado',
              ),
              _buildInfoTile(
                'Número',
                registrationProvider.registration.number.isNotEmpty
                    ? registrationProvider.registration.number
                    : 'Não informado',
              ),
              _buildInfoTile(
                'Bairro',
                registrationProvider.registration.neighborhood.isNotEmpty
                    ? registrationProvider.registration.neighborhood
                    : 'Não informado',
              ),
              _buildInfoTile(
                'Cidade',
                registrationProvider.registration.city.isNotEmpty
                    ? registrationProvider.registration.city
                    : 'Não informado',
              ),
              _buildInfoTile(
                'UF',
                registrationProvider.registration.uf.isNotEmpty
                    ? registrationProvider.registration.uf
                    : 'Não informado',
              ),
              _buildInfoTile(
                'Senha',
                registrationProvider.registration.password.isNotEmpty
                    ? '••••••••'
                    : 'Não informado',
              ),

              const SizedBox(height: 32),

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
