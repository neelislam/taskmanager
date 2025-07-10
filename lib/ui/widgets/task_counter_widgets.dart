import 'package:flutter/material.dart';

class TaskCounterWidgets extends StatelessWidget {
  const TaskCounterWidgets({
    super.key, required this.title, required this.count,
  });

  final String title;
  final int count;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('$count',
              style:
              Theme.of(context).textTheme.titleLarge,),
            Text(title, maxLines: 1,),
          ],
        ),
      ),
    );
  }
}
