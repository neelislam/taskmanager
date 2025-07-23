import 'package:flutter/material.dart';
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

  static GlobalKey<NavigatorState> navigator = GlobalKey<NavigatorState>();

  @override
  State<TaskManagerApp> createState() => _TaskManagerAppState();
}

class _TaskManagerAppState extends State<TaskManagerApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: TaskManagerApp.navigator, // Use TaskManagerApp.navigator
      theme: ThemeData(
        colorSchemeSeed: Colors.pink,
        //primarySwatch: Colors.deepOrange, // Note: primarySwatch is deprecated in favor of colorSchemeSeed
        textTheme: TextTheme(
            titleLarge: TextStyle(
                fontSize: 28, fontWeight: FontWeight.w700
            )
        ),
        inputDecorationTheme: InputDecorationTheme(
          fillColor: Colors.white,
          filled: true,
          // to make the text slim
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
            fixedSize: Size.fromWidth(double.maxFinite),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8), // Use BorderRadius.circular
            ),
            padding: EdgeInsets.symmetric(vertical: 12),
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
      initialRoute: SplashScreen.name, // Use the static name
      routes: {
        SplashScreen.name : (context) => SplashScreen(),
        SignInScreen.name : (context) => SignInScreen(),
        SignUpScreen.name : (context) => SignUpScreen(),
        ForgotPasswordEmailScreen.name : (context) => ForgotPasswordEmailScreen(),
        PinVerificationScreen.name : (context) => PinVerificationScreen(),
        ChangePasswordScreen.name : (context) => ChangePasswordScreen(),
        MainNavBarHolderScreen.name : (context) => MainNavBarHolderScreen(),
        AddNewTaskScreen.name : (context) => AddNewTaskScreen(),
        UpdateProfileScreen.name : (context) => UpdateProfileScreen(),
      },
    );
  }
}