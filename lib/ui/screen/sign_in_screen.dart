import 'package:flutter/material.dart';
import 'package:taskmanager/ui/widgets/screen_background.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenBackground(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 80,),
              Text('Get Started With', style: Theme.of(context).textTheme.titleLarge),
              const SizedBox(height: 24,),
              TextFormField(
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  hintText:'Email',
              ),
              ),
              const SizedBox(height: 8,),
              TextFormField(
                obscureText: true,
                decoration: InputDecoration(
                  hintText:'Password',
                ),
              ),
              const SizedBox(height: 16,),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  fixedSize: Size.fromWidth(double.maxFinite),//jototuku jaite pare dui pashe
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadiusGeometry.circular(4),

                  ),
                  padding: EdgeInsets.symmetric(vertical: 12),
                ),
                onPressed: () {},
                child: Icon(Icons.arrow_circle_right_outlined),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
