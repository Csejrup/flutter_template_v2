import 'package:flutter/material.dart';

class BusinessPage extends StatelessWidget {
  const BusinessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Business Page'),
      ),
      body: const Center(
        child: Text(
          'Welcome to the Business Page!',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
