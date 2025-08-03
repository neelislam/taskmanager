import 'package:flutter/material.dart';
import 'package:get/get.dart'; // Import GetX
import 'package:taskmanager/ui/screen/add_new_task_screen.dart';
import 'package:taskmanager/ui/screen/fp_ur_email.dart';
import 'package:taskmanager/ui/screen/main_nav_bar_screen.dart';
import 'package:taskmanager/ui/screen/pin_verification_screen.dart';
import 'package:taskmanager/ui/screen/set_password.dart';
import 'package:taskmanager/ui/screen/sign_in_screen.dart';
import 'package:taskmanager/ui/screen/sign_up_page.dart';
import 'package:taskmanager/ui/screen/splash_screen.dart';
import 'package:taskmanager/ui/screen/update_profile_screen.dart';

class TaskManagerApp extends StatefulWidget {
  const TaskManagerApp({super.key});

  // You generally won't need this GlobalKey with GetX for routing,
  // as GetX provides its own navigation methods (Get.to, Get.offAll, etc.)
  // If you have specific reasons for keeping it (e.g., non-GetX specific
  // dialogs or external package integrations), you can, but often it's redundant.
  // static GlobalKey<NavigatorState> navigator = GlobalKey<NavigatorState>();

  @override
  State<TaskManagerApp> createState() => _TaskManagerAppState();
}

class _TaskManagerAppState extends State<TaskManagerApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp( // Changed from MaterialApp to GetMaterialApp
      // navigatorKey is often not needed with GetX's built-in navigation
      // navigatorKey: TaskManagerApp.navigator,
      theme: ThemeData(
        colorSchemeSeed: Colors.pink,
        textTheme: const TextTheme( // Added const
            titleLarge: TextStyle(
                fontSize: 28, fontWeight: FontWeight.w700
            )
        ),
        inputDecorationTheme: const InputDecorationTheme( // Added const
          fillColor: Colors.white,
          filled: true,
          contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          hintStyle: TextStyle(
            color: Colors.grey,
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            fixedSize: const Size.fromWidth(double.maxFinite), // Added const
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            padding: const EdgeInsets.symmetric(vertical: 12), // Added const
            backgroundColor: Colors.green,
            foregroundColor: Colors.white,
          ),
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            foregroundColor: Colors.pink,
          ),
        ),
      ),
      initialRoute: SplashScreen.name,
      // GetX works well with named routes.
      // You can also use GetPage for more advanced routing features like middleware
      // and nested routes, but your current setup works fine with `routes`.
      routes: {
        SplashScreen.name : (context) => const SplashScreen(), // Added const
        SignInScreen.name : (context) => const SignInScreen(), // Added const
        SignUpScreen.name : (context) => const SignUpScreen(), // Added const
        ForgotPasswordEmailScreen.name : (context) => const ForgotPasswordEmailScreen(), // Added const
        PinVerificationScreen.name : (context) => const PinVerificationScreen(), // Added const
        ChangePasswordScreen.name : (context) => const ChangePasswordScreen(), // Added const
        MainNavBarHolderScreen.name : (context) => const MainNavBarHolderScreen(), // Added const
        AddNewTaskScreen.name : (context) => const AddNewTaskScreen(), // Added const
        UpdateProfileScreen.name : (context) => const UpdateProfileScreen(), // Added const
      },
      debugShowCheckedModeBanner: false, // Often useful to turn off debug banner
    );
  }
}