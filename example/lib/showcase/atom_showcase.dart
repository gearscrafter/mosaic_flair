import 'package:flutter/material.dart';
import 'package:atomic_design_system/atomic_design_system.dart';

class AtomShowcase extends StatelessWidget {
  const AtomShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Atoms Showcase'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Buttons'),
            const SizedBox(height: 8.0),
            const AppButton(
              onPressed: null,
              label: 'Disabled Button',
            ),
            const SizedBox(height: 8.0),
            AppButton(
              onPressed: () {},
              label: 'Enabled Button',
            ),
            const SizedBox(height: 16.0),
            const AppText('Icons'),
            const SizedBox(height: 8.0),
            const AppIcon(
              iconData: Icons.star,
            ),
            const SizedBox(height: 8.0),
            const AppText('Input Fields'),
            const SizedBox(height: 8.0),
            AppInput(
                controller: TextEditingController(text: ''),
                hintText: 'Enter text'),
            const SizedBox(height: 16.0),
            const AppText('Texts'),
            const SizedBox(height: 8.0),
            const AppText('Sample Text'),
          ],
        ),
      ),
    );
  }
}
