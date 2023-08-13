import 'package:flutter/material.dart';

class TabView extends StatelessWidget {
  const TabView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tab View'),
      ),
      body: const Center(
        child: Text('TAAAPP'),
      ),
    );
  }
}
