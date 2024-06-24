import 'package:flutter/material.dart';

import '../templates/support_template.dart';

class SupportPage extends StatelessWidget {
  final List<String>? schedulesList;
  final String? email;
  final String? phone;
  final String? message;
  const SupportPage({
    super.key,
    this.email,
    this.phone,
    this.message,
    this.schedulesList,
  });

  @override
  Widget build(BuildContext context) {
    return SupportTemplate(
      email: email,
      phone: phone,
      message: message,
      schedulesList: schedulesList,
    );
  }
}
