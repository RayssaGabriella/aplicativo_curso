import 'package:flutter/material.dart';
import '../dados/cursos_dados.dart' as dados;

class FavoritosTela extends StatefulWidget {
  const FavoritosTela({super.key});

  @override
  State<FavoritosTela> createState() => _FavoritosTelaState();
}

class _FavoritosTelaState extends State<FavoritosTela> {
  @override
  Widget build(BuildContext context) {
    final cursosFavoritos = dados.cursos.where((curso) {
      return dados.favoritos.contains(curso['nome']);
    }).toList();

    if (cursosFavoritos.isEmpty) {
      return const Center(
        child: Text(
          'Nenhum curso favoritado.',
          style: TextStyle(fontSize: 16),
        ),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: cursosFavoritos.length,
      itemBuilder: (context, index) {
        final curso = cursosFavoritos[index];

        return Card(
          margin: const EdgeInsets.only(bottom: 12),
          child: ListTile(
            leading: CircleAvatar(
              child: Icon(curso['icone']),
            ),

            title: Text(
              curso['nome'],
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),

            subtitle: Text(
              '${curso['aulas']} aulas',
            ),

            trailing: IconButton(
              icon: const Icon(
                Icons.favorite,
                color: Colors.red,
              ),
              onPressed: () {
                setState(() {
                  dados.favoritos.remove(curso['nome']);
                });
              },
            ),
          ),
        );
      },
    );
  }
}