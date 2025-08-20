import 'package:flutter/material.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({super.key});

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  final _formKey = GlobalKey<FormState>();
  final _msgCtrl = TextEditingController();

  @override
  void dispose() {
    _msgCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const darkGreen = Color(0xFF1B5E20);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contato', style: TextStyle(color: Colors.white)),
        backgroundColor: darkGreen,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          elevation: 2,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.contact_mail, color: darkGreen, size: 48),
                  const SizedBox(height: 16),
                  const Text(
                    'Nos conte o motivo do contato:',
                    style: TextStyle(fontSize: 16, color: darkGreen),
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: _msgCtrl,
                    maxLines: 5,
                    decoration: InputDecoration(
                      labelText: 'Mensagem',
                      labelStyle: const TextStyle(color: darkGreen),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(color: darkGreen),
                      ),
                    ),
                    validator: (v) => (v == null || v.isEmpty) ? 'Digite sua mensagem' : null,
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
                      icon: const Icon(Icons.send, color: Colors.white),
                      label: const Text('Enviar', style: TextStyle(color: Colors.white)),
                      onPressed: () {
                        if (_formKey.currentState?.validate() ?? false) {
                          // Futuro: enviar mensagem para backend ou e-mail
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Mensagem enviada!')),
                          );
                          _msgCtrl.clear();
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}