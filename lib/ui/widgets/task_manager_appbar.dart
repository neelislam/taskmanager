import 'package:flutter/material.dart';
import 'package:taskmanager/ui/controllers/auth_controller.dart';
import 'package:taskmanager/ui/screen/sign_in_screen.dart';
import 'package:taskmanager/ui/screen/update_profile_screen.dart';

class TaskManagerAppBar extends StatelessWidget implements PreferredSizeWidget {
  const TaskManagerAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.greenAccent,
      title: GestureDetector(
        onTap: () {
          _onTapProfileAppBar(context);
        },
        child: Row(
          children: [
            CircleAvatar(),
            const SizedBox(width: 14,),
            Expanded(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [ // Added const here as children are constant
                    Text(
                      AuthController.userModel!.firstName,
                      style:
                      const TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,

                      ),
                    ),
                    Text(
                      AuthController.userModel!.email,                      style:
                      const TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                        fontWeight: FontWeight.w400,

                      ),
                    ),
                  ]

              ),
            ),
            IconButton(
              onPressed: () {
                _onTapLogoutButton(context); // Pass context to the logout function
              },
              icon: const Icon(Icons.logout), // Added const for the icon
            )
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight); // Added const

  Future<void> _onTapLogoutButton(BuildContext context) async {
    await  AuthController.clearData();
    Navigator.pushNamed(context, SignInScreen.name);
  }

  void _onTapProfileAppBar(BuildContext context){
    if(ModalRoute.of(context)!.settings.name != UpdateProfileScreen.name){
      Navigator.pushNamed(context, UpdateProfileScreen.name);
    }
  }
}