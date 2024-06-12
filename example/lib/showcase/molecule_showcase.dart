import 'package:flutter/material.dart';
import 'package:atomic_design_system/atomic_design_system.dart';

class MoleculeShowcase extends StatelessWidget {
  const MoleculeShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Molecules Showcase'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize:
                MainAxisSize.min, // Establecer mainAxisSize a MainAxisSize.min
            children: [
              const Text('Navigation Bar'),
              const SizedBox(height: 8.0),
              SizedBox(
                height: 200,
                child: AppNavigationBar(
                  currentIndex: 0,
                  onTap: (index) {},
                  items: const [
                    BottomNavigationBarItem(
                        icon: Icon(Icons.home), label: 'home'),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.call), label: 'call'),
                  ],
                ),
              ),
              const SizedBox(height: 16.0),
              const Text('Product Card'),
              const SizedBox(height: 8.0),
              ProductCard(
                title: 'Product',
                image: 'https://via.placeholder.com/150',
                price: 29.99,
                onTap: () {},
              ),
              const SizedBox(height: 16.0),
              const Text('Search Bar'),
              const SizedBox(height: 8.0),
              SearchBarM(
                controller: TextEditingController(text: 'buscando...'),
                hintText: 'buscador',
              ),
              const SizedBox(height: 16.0),
              const Text('Carousel'),
              const SizedBox(height: 8.0),
              AppCarousel(
                height: 200,
                items: [
                  Image.network('https://via.placeholder.com/300x200'),
                  Image.network('https://via.placeholder.com/300x200'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
