import 'package:flutter/material.dart';
import '../widgets/task_card.dart';
class ProgressTaskScreen extends StatefulWidget {
  const ProgressTaskScreen({super.key});
  @override
  State<ProgressTaskScreen> createState() => _ProgressTaskScreenState();
}
class _ProgressTaskScreenState extends State<ProgressTaskScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          // return TaskCard(taskType: TaskType.progress,);
        },
      ),
    );
  }
}
