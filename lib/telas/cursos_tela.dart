import 'package:flutter/material.dart';
import '../dados/cursos_dados.dart' as dados;
import '../widgets/curso_card.dart';

class CursosTela extends StatefulWidget {
  const CursosTela({super.key});

  @override
  State<CursosTela> createState() => _CursosTelaState();
}

class _CursosTelaState extends State<CursosTela> {
  final TextEditingController pesquisaController =
      TextEditingController();

  String pesquisa = '';

  @override
  Widget build(BuildContext context) {
    final cursosFiltrados = dados.cursos.where((curso) {
      return curso['nome']
          .toString()
          .toLowerCase()
          .contains(pesquisa.toLowerCase());
    }).toList();

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: TextField(
            controller: pesquisaController,
            decoration: const InputDecoration(
              labelText: 'Pesquisar curso',
              prefixIcon: Icon(Icons.search),
              border: OutlineInputBorder(),
            ),
            onChanged: (valor) {
              setState(() {
                pesquisa = valor;
              });
            },
          ),
        ),

        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemCount: cursosFiltrados.length,
            itemBuilder: (context, index) {
              final curso = cursosFiltrados[index];

              final nomeCurso = curso['nome'];
              final estaFavorito =
                  dados.favoritos.contains(nomeCurso);

              return CursoCard(
                nome: curso['nome'],
                descricao: curso['descricao'],
                aulas: curso['aulas'],
                icone: curso['icone'],
                favorito: estaFavorito,

                onFavoritar: () {
                  setState(() {
                    if (estaFavorito) {
                      dados.favoritos.remove(nomeCurso);
                    } else {
                      dados.favoritos.add(nomeCurso);
                    }
                  });
                },
              );
            },
          ),
        ),
      ],
    );
  }
}