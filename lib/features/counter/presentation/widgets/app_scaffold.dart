import 'package:flutter/material.dart';

class AppScaffold extends StatelessWidget {
  const AppScaffold({
    super.key,
    this.body,
    this.bottomNavigationBar,
    this.isSafeArea = true,
  });

  final Widget? body;
  final Widget? bottomNavigationBar;
  final bool? isSafeArea;

  @override
  Widget build(BuildContext context) {
    final scaffoldBody = isSafeArea! ? SafeArea(child: body!) : body;
    return Scaffold(
      body: scaffoldBody,
      bottomNavigationBar: bottomNavigationBar,
    );
  }
}
