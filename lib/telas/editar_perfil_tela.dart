import 'package:flutter/material.dart';

class EditarPerfilTela extends StatefulWidget {
  final String nomeAtual;
  final String emailAtual;

  const EditarPerfilTela({
    super.key,
    required this.nomeAtual,
    required this.emailAtual,
  });

  @override
  State<EditarPerfilTela> createState() => _EditarPerfilTelaState();
}

class _EditarPerfilTelaState extends State<EditarPerfilTela> {
  late TextEditingController nomeController;
  late TextEditingController emailController;

  @override
  void initState() {
    super.initState();

    nomeController = TextEditingController(
      text: widget.nomeAtual,
    );

    emailController = TextEditingController(
      text: widget.emailAtual,
    );
  }

  @override
  void dispose() {
    nomeController.dispose();
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Editar perfil'),
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: nomeController,
              decoration: const InputDecoration(
                labelText: 'Nome',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.person),
              ),
            ),

            const SizedBox(height: 20),

            TextField(
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                labelText: 'E-mail',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.email),
              ),
            ),

            const SizedBox(height: 30),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(
                    context,
                    {
                      'nome': nomeController.text,
                      'email': emailController.text,
                    },
                  );
                },
                child: const Text('Salvar alterações'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}