import 'package:flutter/material.dart';

class LoveCarPage extends StatefulWidget {
  // const LoveCarPage({super.key});

  @override
  State<LoveCarPage> createState() => _LoveCarPageState();
}

class _LoveCarPageState extends State<LoveCarPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('爱车'),
      ),
      backgroundColor: Colors.grey[200],
      body: const Text('爱车'),
    );
  }
}
