import 'package:flutter/material.dart';

import 'showcase/atom_showcase.dart';
import 'showcase/molecule_showcase.dart';
import 'showcase/organism_showcase.dart';
import 'showcase/page_showcase.dart';
import 'showcase/template_showcase.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mosaic Flair Showcase',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ShowcaseHomePage(),
    );
  }
}

class ShowcaseHomePage extends StatelessWidget {
  const ShowcaseHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mosaic Flair Showcase'),
      ),
      body: ListView(
        children: [
          ListTile(
            title: const Text('Atoms Showcase'),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const AtomsShowcase()),
            ),
          ),
          ListTile(
            title: const Text('Molecules Showcase'),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const MoleculeShowcase()),
            ),
          ),
          ListTile(
            title: const Text('Organisms Showcase'),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const OrganismShowcase()),
            ),
          ),
          ListTile(
            title: const Text('Templates Showcase'),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const TemplateShowcase()),
            ),
          ),
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
