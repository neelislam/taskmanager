import 'package:flutter/material.dart';


class TaskCard extends StatelessWidget {
  const TaskCard({
    super.key, required this.title, required this.count, this.taskButtonColor,
  });

  final String title;
  final int count;
  final Color? taskButtonColor;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 10,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Title will be here',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            Text(
              'Description',
              style: TextStyle(color: Colors.black12),
            ),
            Text('Date 12/12/12'),
            Text('Date 12/12/12'),
            const SizedBox(height: 8),
            Row(
              children: [
                Chip(
                  label: Text(
                    'New',
                    style: TextStyle(color: Colors.white),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  backgroundColor: taskButtonColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadiusGeometry.circular(
                      20,
                    ),
                  ),
                ),
                Spacer(),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.delete),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.edit),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
