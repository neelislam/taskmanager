import 'package:flutter/material.dart';
import 'package:taskmanager/ui/screen/update_profile_screen.dart';

class TaskManagerAppBar extends StatelessWidget implements PreferredSizeWidget {
  const TaskManagerAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) { // context is available here
    return AppBar(
      backgroundColor: Colors.greenAccent,
      title: GestureDetector(
        onTap: () { // Wrap _onTapProfileAppBar in an anonymous function to pass context
          _onTapProfileAppBar(context);
        },
        child: Row(
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
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight); //Will keep a fixed height for the appbar in every screen

  // Modified to accept BuildContext
  void _onTapProfileAppBar(BuildContext context){
    Navigator.pushNamed(context, UpdateProfileScreen.name);
  }
}