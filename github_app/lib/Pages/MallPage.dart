import 'package:flutter/material.dart';

class MallPage extends StatefulWidget {
  // const MallPage({super.key});

  @override
  State<MallPage> createState() => _MallPageState();
}

class _MallPageState extends State<MallPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('商城'),
      ),
      backgroundColor: Colors.grey[200],
      body: const Text('商城'),
    );
  }
}
