import 'package:flutter/material.dart';
import 'package:taskmanager/ui/screen/new_task_list_screen.dart';

class MainNavBarScreen extends StatefulWidget {
  const MainNavBarScreen({super.key});
  static const String name = '/main_nav_bar';

  @override
  State<MainNavBarScreen> createState() => _MainNavBarScreenState();
}

class _MainNavBarScreenState extends State<MainNavBarScreen> {
 final List<Widget> _screens = [ NewTaskListScreen()];
 int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TaskManagerAppBar(),
      body: _screens[_selectedIndex],
      bottomNavigationBar:
      NavigationBar(
          selectedIndex: _selectedIndex,
          onDestinationSelected: (int index){
            _selectedIndex = index;
            setState(() {

            });
          },
          destinations:
      [
        NavigationDestination(icon: Icon(Icons.new_label),
            label: 'New'),

        NavigationDestination(icon: Icon(Icons.done),
            label: 'Completed'),
        NavigationDestination(icon: Icon(Icons.arrow_circle_right_outlined),
            label: 'Progress'),
        NavigationDestination(icon: Icon(Icons.close),
            label: 'Cancel'),
      ],
      ),
    );
  }
}

class TaskManagerAppBar extends StatelessWidget implements PreferredSizeWidget {
  const TaskManagerAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.greenAccent,
      title: Row(
        children: [
          CircleAvatar(),
          const SizedBox(width: 14,),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Neel Islam',
                style:
                  TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,

                  ),
                ),
                Text('neelislam@gmail.com',
                  style:
                  TextStyle(
                    fontSize: 14,
                    color: Colors.white,
                    fontWeight: FontWeight.w400,

                  ),
                ),
              ]

            ),
          ),
          IconButton(onPressed: (){},  icon: Icon(Icons.logout),
          )
        ],
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(kToolbarHeight); //Will keep a fixed height for the appbar in every screen
}
