import 'package:flutter/material.dart';

class SchoolPage extends StatelessWidget {
  const SchoolPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('School Page'),
      ),
      body: const Center(
        child: Text(
          'Welcome to the School Page!',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
