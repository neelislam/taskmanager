import 'package:flutter/material.dart';

import '../widgets/task_counter_widgets.dart';

class NewTaskListScreen extends StatefulWidget {
  const NewTaskListScreen({super.key});

  @override
  State<NewTaskListScreen> createState() => _NewTaskListScreenState();
}

class _NewTaskListScreenState extends State<NewTaskListScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(children: [
        const SizedBox(height: 14,),
        SizedBox(
          height: 100,
          child: ListView.separated(itemBuilder: (context, index) {
            return TaskCounterWidgets(
              title: 'Progress',
              count: 12,
            );
          },
              separatorBuilder: (context, index)=>const SizedBox(width: 1,),
              itemCount: 5,
          scrollDirection: Axis.horizontal,),
        ),
        Expanded(child: ListView.builder(
          itemCount: 10,
            itemBuilder: (context, index)
        {
          return SizedBox();
        }
        )
        )
      ]),
    );
  }
}

