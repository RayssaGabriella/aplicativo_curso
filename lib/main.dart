import 'package:flutter/material.dart';

import 'telas/inicio_tela.dart';
import 'telas/cursos_tela.dart';
import 'telas/favoritos_tela.dart';
import 'telas/perfil_tela.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        navigationBarTheme: const NavigationBarThemeData(
          backgroundColor: Colors.purple,
          indicatorColor: Colors.white24,
          labelTextStyle: WidgetStatePropertyAll(
            TextStyle(
              color: Colors.white,
            ),
          ),
          iconTheme: WidgetStatePropertyAll(
            IconThemeData(
              color: Colors.white,
            ),
          ),
        ),
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int indice = 0;

  final telas = const [
    InicioTela(),
    CursosTela(),
      FavoritosTela(),
    PerfilTela(),
  ];

  final titulos = const [
    'Inicio',
    'Meus cursos',
    'Favoritos',
    'Meu perfil',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(titulos[indice]),
      ),
      body: Center(
        child: telas[indice],
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: indice,
        onDestinationSelected: (valor) {
          setState(() {
            indice = valor;
          });
        },
        destinations: const [
      NavigationDestination(
       icon: Icon(Icons.home),
       label: 'Início',
      ),
      NavigationDestination(
      icon: Icon(Icons.school_outlined),
      label: 'Cursos',
    ),
      NavigationDestination(
      icon: Icon(Icons.favorite),
      label: 'Favoritos',
    ),
      NavigationDestination(
      icon: Icon(Icons.person),
      label: 'Perfil',
        ),
      ],
      ),
    );
  }
}
