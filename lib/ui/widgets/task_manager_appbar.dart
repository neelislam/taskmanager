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
    // Get the user model from AuthController, safely handling null
    final user = AuthController.userModel;

    return AppBar(
      backgroundColor: Colors.greenAccent,
      title: GestureDetector(
        onTap: () {
          _onTapProfileAppBar(context);
        },
        child: Row(
          children: [
            // Display CircleAvatar, you might want to add user profile picture here
            const CircleAvatar(),
            const SizedBox(width: 14,),
            Expanded(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      user != null
                          ? '${user.firstName ?? ''} ${user.lastName ?? ''}' // Use fullName getter or combine
                          : 'Guest User', // Default text if user is null
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    // Safely access email, provide default if null
                    Text(
                      user?.email ?? 'No Email', // Use null-aware access and default
                      style: const TextStyle(
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
    await AuthController.clearData();
    Navigator.pushNamedAndRemoveUntil(context, SignInScreen.name, (route) => false); // Navigate and clear back stack
  }

  void _onTapProfileAppBar(BuildContext context){
    // Ensure context is valid and route settings are available
    if(ModalRoute.of(context)?.settings.name != UpdateProfileScreen.name){
      Navigator.pushNamed(context, UpdateProfileScreen.name);
    }
  }
}
