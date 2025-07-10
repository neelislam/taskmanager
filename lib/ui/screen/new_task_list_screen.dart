import 'package:flutter/material.dart';
import 'package:taskmanager/ui/screen/add_new_task_screen.dart';

import '../widgets/task_card.dart';
import '../widgets/task_counter_widgets.dart';

class NewTaskListScreen extends StatefulWidget {
  const NewTaskListScreen({super.key});

  @override
  State<NewTaskListScreen> createState() => _NewTaskListScreenState();
}

class _NewTaskListScreenState extends State<NewTaskListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            const SizedBox(height: 14),
            SizedBox(
              height: 100,
              child: ListView.separated(
                itemBuilder: (context, index) {
                  return TaskCounterWidgets(title: 'Progress', count: 12);
                },
                separatorBuilder: (context, index) => const SizedBox(width: 1),
                itemCount: 5,
                scrollDirection: Axis.horizontal,
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return TaskCard(taskType: TaskType.tNew,);
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _onTapAddNewTaskButton,
        child: Icon(Icons.add),
      ),
    );
  }

  void _onTapAddNewTaskButton() {
    Navigator.pushNamed(context, AddNewTaskScreen.name);
  }
}

