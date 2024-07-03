import 'package:flutter/material.dart';

class SalesView extends StatelessWidget {
  const SalesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sales',style: TextStyle(
          color: Colors.black,
        ),),
      ),
      body: const Center(
        child: Text('Sales',style: TextStyle(
          color: Colors.black,
        ),),
      ),
    );
  }
}