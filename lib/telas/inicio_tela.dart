import 'package:flutter/material.dart';

class InicioTela extends StatelessWidget {
  const InicioTela({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        const Text(
          'Olá, estudante!',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),

        const SizedBox(height: 20),

        // Seção 1: Curso em andamento
        const Text(
          'Curso em andamento',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),

        const SizedBox(height: 10),

        Card(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Row(
                  children: [
                    Icon(
                      Icons.phone_android,
                      size: 40,
                    ),

                    SizedBox(width: 12),

                    Text(
                      'Flutter Básico',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 12),

                const Text('8 de 12 aulas concluídas'),

                const SizedBox(height: 8),

                LinearProgressIndicator(
                  value: 8 / 12,
                  minHeight: 10,
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),

                const SizedBox(height: 8),

                const Text('66% concluído'),
              ],
            ),
          ),
        ),

        const SizedBox(height: 24),

        // Seção 2: Cursos disponíveis
        const Text(
          'Cursos disponíveis',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),

        const SizedBox(height: 10),

        Card(
          child: ListTile(
            leading: const Icon(Icons.code),
            title: const Text('Dart Essencial'),
            subtitle: const Text('10 aulas disponíveis'),
          ),
        ),

        Card(
          child: ListTile(
            leading: const Icon(Icons.design_services),
            title: const Text('Interfaces Mobile'),
            subtitle: const Text('15 aulas disponíveis'),
          ),
        ),

        const SizedBox(height: 24),

        // Seção 3: Resumo do estudante
        const Text(
          'Resumo do estudante',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),

        const SizedBox(height: 10),

        Card(
          child: const ListTile(
            leading: Icon(Icons.school),
            title: Text('Cursos matriculados'),
            subtitle: Text('3 cursos'),
          ),
        ),

        Card(
          child: const ListTile(
            leading: Icon(Icons.check_circle),
            title: Text('Aulas concluídas'),
            subtitle: Text('8 aulas'),
          ),
        ),
      ],
    );
  }
}