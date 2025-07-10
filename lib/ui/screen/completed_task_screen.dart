import 'package:flutter/material.dart';

import '../widgets/task_card.dart';

class CompletedTaskScreen extends StatefulWidget {
  const CompletedTaskScreen({super.key});

  @override
  State<CompletedTaskScreen> createState() => _CompletedTaskScreenState();
}

class _CompletedTaskScreenState extends State<CompletedTaskScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return TaskCard(title: 'Cancelled',
              count: 7,
              taskButtonColor: Colors.green );
        },
      ),
    );
  }
}
