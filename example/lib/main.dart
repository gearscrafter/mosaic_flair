import 'package:flutter/material.dart';
import 'package:mosaic_flair/mosaic_flair.dart';
import 'showcase/atom_showcase.dart';
import 'showcase/molecule_showcase.dart';
import 'showcase/organism_showcase.dart';
import 'showcase/page_showcase.dart';
import 'showcase/template_showcase.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeApp(path: 'assets/app_config.json', useJsonConfig: false);
  runApp(const MyApp());
}

/// La clase `MyApp` es el punto de entrada principal de la aplicación.
///
/// Esta clase es un widget sin estado (`StatelessWidget`) que configura
/// y construye la aplicación.
class MyApp extends StatelessWidget {
  /// Constructor de `MyApp`.
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      /// Oculta el banner de modo de depuración.
      debugShowCheckedModeBanner: false,

      /// Título de la aplicación.
      title: 'Mosaic Flair Showcase',

      /// Tema de la aplicación.
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),

      /// Página inicial de la aplicación.
      home: const ShowcaseHomePage(),
    );
  }
}

/// La clase `ShowcaseHomePage` es un widget sin estado (`StatelessWidget`)
/// que representa la página principal de la aplicación.
///
/// Esta clase construye una página con una barra de aplicaciones (`AppBar`)
/// y una lista de elementos (`ListView`) que navegan a diferentes pantallas de presentación.
class ShowcaseHomePage extends StatelessWidget {
  /// Constructor de `ShowcaseHomePage`.
  const ShowcaseHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// Barra de aplicaciones con el título de la página.
      appBar: AppBar(
        title: const Text('Mosaic Flair Showcase'),
      ),

      /// Cuerpo de la página que contiene una lista de elementos.
      body: ListView(
        children: [
          /// Elemento de la lista que navega a la pantalla `AtomsShowcase`.
          ListTile(
            title: const Text('Atoms Showcase'),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const AtomsShowcase()),
            ),
          ),

          /// Elemento de la lista que navega a la pantalla `MoleculeShowcase`.
          ListTile(
            title: const Text('Molecules Showcase'),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const MoleculeShowcase()),
            ),
          ),

          /// Elemento de la lista que navega a la pantalla `OrganismShowcase`.
          ListTile(
            title: const Text('Organisms Showcase'),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const OrganismShowcase()),
            ),
          ),

          /// Elemento de la lista que navega a la pantalla `TemplateShowcase`.
          ListTile(
            title: const Text('Templates Showcase'),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const TemplateShowcase()),
            ),
          ),

          /// Elemento de la lista que navega a la pantalla `PageShowcase`.
          ListTile(
            title: const Text('Pages Showcase'),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const PageShowcase()),
            ),
          ),
        ],
      ),
    );
  }
}
