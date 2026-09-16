import 'package:flutter/material.dart';

class CursosTela extends StatelessWidget {
  const CursosTela({super.key});

  @override
  Widget build(BuildContext context) {
    final cursos = const [
      {
        'nome': 'Flutter Básico',
        'descricao':
            'Curso introdutório sobre desenvolvimento mobile utilizando Flutter.',
        'aulas': '12 aulas',
        'icone': Icons.flutter_dash,
      },
      {
        'nome': 'Dart Essencial',
        'descricao':
            'Aprenda os principais conceitos da linguagem Dart.',
        'aulas': '10 aulas',
        'icone': Icons.code,
      },
      {
        'nome': 'Interface Mobile',
        'descricao':
            'Aprenda a criar interfaces bonitas e organizadas para aplicativos.',
        'aulas': '15 aulas',
        'icone': Icons.phone_android,
      },
    ];

    return ListView.builder(
      padding: const EdgeInsets.all(12),
      itemCount: cursos.length,
      itemBuilder: (context, indice) {
        final curso = cursos[indice];

        return Card(
          child: ListTile(
            contentPadding: const EdgeInsets.all(12),

            leading: CircleAvatar(
              backgroundColor: Colors.deepPurple,
              child: Icon(
                curso['icone'] as IconData,
                color: Colors.white,
              ),
            ),

            title: Text(
              curso['nome'] as String,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),

            subtitle: Padding(
              padding: const EdgeInsets.only(top: 6),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    curso['descricao'] as String,
                  ),

                  const SizedBox(height: 6),

                  Text(
                    curso['aulas'] as String,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 6),

                  const Text(
                    'Continuar curso',
                    style: TextStyle(
                      color: Colors.deepPurple,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),

            trailing: const Icon(
              Icons.chevron_right,
            ),
          ),
        );
      },
    );
  }
}