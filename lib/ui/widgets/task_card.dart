import 'package:flutter/material.dart';


class TaskCard extends StatelessWidget {
  const TaskCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Chip(label: Text('New',
      style: TextStyle(
        color: Colors.white,
      ),),
      padding: EdgeInsets.symmetric(horizontal: 16),
      backgroundColor: Colors.lightGreenAccent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.circular(20),
      ),
    );
  }
}
