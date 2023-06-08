import 'package:flutter/material.dart';

class ActivityPage extends StatefulWidget {
  // const ActivityPage({super.key});

  @override
  State<ActivityPage> createState() => _ActivityPageState();
}

class _ActivityPageState extends State<ActivityPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('活动'),
      ),
      backgroundColor: Colors.grey[200],
      body: const Text('活动'),
    );
  }
}
