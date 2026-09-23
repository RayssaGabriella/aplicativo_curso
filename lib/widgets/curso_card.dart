import 'package:flutter/material.dart';

class CursoCard extends StatelessWidget {
  final String nome;
  final String descricao;
  final int aulas;
  final IconData icone;
  final VoidCallback? onFavoritar;
  final bool favorito;

  const CursoCard({
    super.key,
    required this.nome,
    required this.descricao,
    required this.aulas,
    required this.icone,
    this.onFavoritar,
    this.favorito = false,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.only(bottom: 14),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.all(16),

        leading: CircleAvatar(
          radius: 25,
          backgroundColor: Colors.deepPurple.shade100,
          child: Icon(
            icone,
            color: Colors.deepPurple,
          ),
        ),

        title: Text(
          nome,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 17,
          ),
        ),

        subtitle: Padding(
          padding: const EdgeInsets.only(top: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(descricao),

              const SizedBox(height: 6),

              Text(
                '$aulas aulas',
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                ),
              ),

              const SizedBox(height: 8),

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

        trailing: IconButton(
          icon: Icon(
            favorito
                ? Icons.favorite
                : Icons.favorite_border,
            color: favorito ? Colors.red : Colors.grey,
          ),
          onPressed: onFavoritar,
        ),
      ),
    );
  }
}