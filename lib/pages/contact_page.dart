import 'package:flutter/material.dart';
import 'package:mosaic_flair/mosaic_flair.dart';

class ContactPage extends StatelessWidget {
  final String? contact;
  final String? email;
  const ContactPage({this.contact, this.email, super.key});

  @override
  Widget build(BuildContext context) {
    return ContactTemplate(
      contact: contact,
      email: email,
    );
  }
}
