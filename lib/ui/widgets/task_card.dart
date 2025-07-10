import 'package:flutter/material.dart';

enum TaskType{
  tNew,
  progress,
  complete,
  cancelled
}


class TaskCard extends StatelessWidget {
  const TaskCard({
    super.key, required this.taskType,
  });
final TaskType taskType;


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
                    _getTaskTypeName(),
                    style: TextStyle(color: Colors.white),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  backgroundColor:  _getTaskChipColor(),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadiusGeometry.circular(20,),
                  side: BorderSide.none,
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
  Color _getTaskChipColor(){
    if(taskType == TaskType.tNew){
      return Colors.blue;
    } else if(taskType == TaskType.progress){
      return Colors.purpleAccent;
    } else if(taskType == TaskType.complete){
      return Colors.lightGreenAccent;
    } else {
      return Colors.red;
    }
  }

  String _getTaskTypeName(){
    switch (taskType){
      case TaskType.tNew:
        return 'New';
      case TaskType.progress:
        return 'Progress';

      case TaskType.complete:
        return 'Completed';

      case TaskType.cancelled:
        return 'Cancelled';

    }
  }
}
