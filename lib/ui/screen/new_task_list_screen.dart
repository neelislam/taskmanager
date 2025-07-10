import 'package:flutter/material.dart';

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
              primary: false,
              shrinkWrap: true,
            itemCount: 10,
              itemBuilder: (context, index)
          {
            return Card(
              elevation: 0,
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 16, vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Title will be here',
                    style: Theme.of(context).textTheme.titleLarge),
                    Text('Description',
                    style: TextStyle(
                      color: Colors.black12
                    ),
                    ),
                    Text('Date 12/12/12'),
                    Text('Date 12/12/12'),
                    const SizedBox(height: 8,),
                    Row(
                      children: [
                        TaskCard(),
                        Spacer(),
                          IconButton(onPressed: (){}, icon: Icon(Icons.delete)),
                          IconButton(onPressed: (){}, icon: Icon(Icons.edit)),
      
                      ],
                    )
                  ],
                ),
              ),
            );
          }
          )
          )
        ]),
      ),
      floatingActionButton:
      FloatingActionButton(onPressed: _onTapAddNewTaskButton,
        child: Icon(Icons.add),
      ),
    );
  }

  void _onTapAddNewTaskButton(){

  }
}


