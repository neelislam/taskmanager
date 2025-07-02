import 'package:flutter/material.dart';
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
        textTheme: TextTheme(

        )
      ),
      home: SplashScreen(),
    );
  }
}
