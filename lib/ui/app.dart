import 'package:flutter/material.dart';

class taskmanagerapp extends StatefulWidget {
  const taskmanagerapp({super.key});

  @override
  State<taskmanagerapp> createState() => _taskmanagerappState();
}

class _taskmanagerappState extends State<taskmanagerapp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: 
        Text('Task Manager'),
      ),
    );
  }
}
