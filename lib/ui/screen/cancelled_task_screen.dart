import 'package:flutter/material.dart';

import '../widgets/task_card.dart';

class CancelledTaskScreen extends StatefulWidget {
  const CancelledTaskScreen({super.key});

  @override
  State<CancelledTaskScreen> createState() => _CancelledTaskScreenState();
}

class _CancelledTaskScreenState extends State<CancelledTaskScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return TaskCard(title: 'Cancelled',
            count: 7,
              taskButtonColor: Colors.redAccent);
        },
      ),
    );
  }
}
