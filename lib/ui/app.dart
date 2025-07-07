import 'package:flutter/material.dart';
import 'package:taskmanager/ui/screen/fp_ur_email.dart';
import 'package:taskmanager/ui/screen/pin_verification_screen.dart';
import 'package:taskmanager/ui/screen/sign_in_screen.dart';
import 'package:taskmanager/ui/screen/sign_up_page.dart';
import 'package:taskmanager/ui/screen/splash_screen.dart';

class taskmanagerapp extends StatefulWidget {
  const taskmanagerapp({super.key});

  @override
  State<taskmanagerapp> createState() => _taskmanagerappState();
}

class _taskmanagerappState extends State<taskmanagerapp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorSchemeSeed: Colors.pink,
        //primarySwatch: Colors.deepOrange,
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
    fixedSize: Size.fromWidth(double.maxFinite),//jototuku jaite pare dui pashe
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadiusGeometry.circular(8),

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
      initialRoute: '/',
      routes: {
        SplashScreen.name : (context) => SplashScreen(),
        SignInScreen.name : (context) => SignInScreen(),
        SignUpScreen.name : (context) => SignUpScreen(),
        ForgotPasswordEmailAddress.name : (context) => ForgotPasswordEmailAddress(),
        PinVerificationScreen.name : (context) => PinVerificationScreen()
      },
    );
  }
}
