import 'package:flutter/material.dart';

class ReportView extends StatelessWidget {
  const ReportView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Report'),
      ),
      body: const Center(
        child: Text('Report',style: TextStyle(
          color: Colors.black,
        ),),
      ),
    );
  }
}