import 'package:flutter/material.dart';

import 'telas/inicio_tela.dart';
import 'telas/cursos_tela.dart';
import 'telas/favoritos_tela.dart';
import 'telas/perfil_tela.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  bool modoEscuro = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
        ),
        useMaterial3: true,
      ),

      darkTheme: ThemeData.dark(
        useMaterial3: true,
      ),

      themeMode: modoEscuro
          ? ThemeMode.dark
          : ThemeMode.light,

      home: HomePage(
        modoEscuro: modoEscuro,
        alterarTema: () {
          setState(() {
            modoEscuro = !modoEscuro;
          });
        },
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  final bool modoEscuro;
  final VoidCallback alterarTema;

  const HomePage({
    super.key,
    required this.modoEscuro,
    required this.alterarTema,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int indice = 0;

  final List<Widget> telas = const [
    InicioTela(),
    CursosTela(),
    FavoritosTela(),
    PerfilTela(),
  ];

  final List<String> titulos = const [
    'Início',
    'Meus cursos',
    'Favoritos',
    'Meu perfil',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          titulos[indice],
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,

        actions: [
          IconButton(
            onPressed: widget.alterarTema,
            icon: Icon(
              widget.modoEscuro
                  ? Icons.light_mode
                  : Icons.dark_mode,
            ),
          ),
        ],
      ),

      body: telas[indice],

      bottomNavigationBar: NavigationBar(
        selectedIndex: indice,

        onDestinationSelected: (novoIndice) {
          setState(() {
            indice = novoIndice;
          });
        },

        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home),
            label: 'Início',
          ),

          NavigationDestination(
            icon: Icon(Icons.school_outlined),
            selectedIcon: Icon(Icons.school),
            label: 'Cursos',
          ),

          NavigationDestination(
            icon: Icon(Icons.favorite_border),
            selectedIcon: Icon(Icons.favorite),
            label: 'Favoritos',
          ),

          NavigationDestination(
            icon: Icon(Icons.person_outline),
            selectedIcon: Icon(Icons.person),
            label: 'Perfil',
          ),
        ],
      ),
    );
  }
}
