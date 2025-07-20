import 'package:flutter/material.dart';
import 'package:taskmanager/data/service/network_caller.dart';
import 'package:taskmanager/ui/screen/add_new_task_screen.dart';
import 'package:taskmanager/ui/widgets/snack_bar_message.dart';

import '../../data/models/task_model.dart';
import '../../data/urls.dart';
import '../widgets/task_card.dart';
import '../widgets/task_counter_widgets.dart';

class NewTaskListScreen extends StatefulWidget {
  const NewTaskListScreen({super.key});

  @override
  State<NewTaskListScreen> createState() => _NewTaskListScreenState();
}

class _NewTaskListScreenState extends State<NewTaskListScreen> {
  bool _getNewTaskInProgress = false;
  List<TaskModel> _newTaskList = [];

  @override
  void initState() {
    super.initState();
    _getNewTaskList();
  }

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
          child: Visibility(
            visible: !_getNewTaskInProgress,
            replacement: Center(
              child: CircularProgressIndicator(),
            ),
            child: ListView.builder(
              itemCount: _newTaskList.length,
              itemBuilder: (context, index) {
                // return TaskCard(taskType: TaskType.tNew);
              },
            ),
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

  Future<void> _getNewTaskList() async {
    _getNewTaskInProgress = true;
    setState(() {});
    NetworkResponse response = await NetworkCaller.getRequest(
      url: Urls.getNewTaskUrl,
    );


  if(response.isSuccess){
    List<TaskModel> list = [];
    for (Map<String, dynamic> jsonData in response.body!['date'] ){
      list.add(TaskModel.fromJson(jsonData));

    }
    _newTaskList = list;

  } else {
  showSnackBarMessage(context, response.errorMessage!);
  }
    _getNewTaskInProgress = false;

    setState(() {});

  }

  void _onTapAddNewTaskButton() {
    Navigator.pushNamed(context, AddNewTaskScreen.name);
  }
}
