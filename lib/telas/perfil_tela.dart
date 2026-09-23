import 'package:flutter/material.dart';
import 'editar_perfil_tela.dart';

class PerfilTela extends StatefulWidget {
  const PerfilTela({super.key});

  @override
  State<PerfilTela> createState() => _PerfilTelaState();
}

class _PerfilTelaState extends State<PerfilTela> {
  String nome = 'Estudante';
  String email = 'estudante@email.com';

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        const SizedBox(height: 20),

        const Center(
          child: CircleAvatar(
            radius: 50,
            child: Icon(
              Icons.person,
              size: 60,
            ),
          ),
        ),

        const SizedBox(height: 16),

        Center(
          child: Text(
            nome,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),

        const SizedBox(height: 8),

        Center(
          child: Text(
            email,
            style: const TextStyle(
              fontSize: 16,
            ),
          ),
        ),

        const SizedBox(height: 30),

        const Card(
          child: ListTile(
            leading: Icon(Icons.school),
            title: Text('Curso atual'),
            subtitle: Text('Flutter Básico'),
          ),
        ),

        const Card(
          child: ListTile(
            leading: Icon(Icons.menu_book),
            title: Text('Cursos matriculados'),
            subtitle: Text('3 cursos'),
          ),
        ),

        const Card(
          child: ListTile(
            leading: Icon(Icons.check_circle),
            title: Text('Aulas concluídas'),
            subtitle: Text('8 aulas'),
          ),
        ),

        const SizedBox(height: 20),

        ElevatedButton.icon(
          onPressed: () async {
            final resultado = await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => EditarPerfilTela(
                  nomeAtual: nome,
                  emailAtual: email,
                ),
              ),
            );

            if (resultado != null) {
              setState(() {
                nome = resultado['nome'];
                email = resultado['email'];
              });
            }
          },
          icon: const Icon(Icons.edit),
          label: const Text('Editar perfil'),
        ),
      ],
    );
  }
}