import 'package:flutter/material.dart';

class FavoritosTela extends StatelessWidget {
  const FavoritosTela({super.key});

  @override
  Widget build(BuildContext context) {
    final favoritos = const [
      'Flutter Básico',
      'Dart Essencial',
      'Interfaces Mobile',
    ];

    return ListView.builder(
      padding: const EdgeInsets.all(12),
      itemCount: favoritos.length,
      itemBuilder: (context, indice) {
        return Card(
          child: ListTile(
            leading: const CircleAvatar(
              child: Icon(
                Icons.favorite,
                color: Colors.red,
              ),
            ),
            title: Text(favoritos[indice]),
            subtitle: const Text(
              'Curso favorito',
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