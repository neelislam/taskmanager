import 'package:flutter/gestures.dart';
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
        child: SingleChildScrollView(
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
                  onPressed: _onTapSignInButton,
                  child: Icon(Icons.arrow_circle_right_outlined),
                ),
                const SizedBox(height: 32,),
                Center(
                  child: Column(
                    children: [
                      TextButton(onPressed: _onTapForgotPasswordButton,
                          child: Text('Forgot Password?',
                          style: TextStyle(
                            color: Colors.deepOrange,
                          ),
                          )
                      ),
                      RichText(text: TextSpan(
                        text: "Don't have an account?",
                        style: TextStyle(
                          color: Colors.black,
                          letterSpacing: 0.4,
                        ),
                        children: [
                          TextSpan(
                            text: 'Sign-up',
                            style: TextStyle(
                              color: Colors.pink,
                              fontWeight: FontWeight.w700,
                            ),
                            recognizer: TapGestureRecognizer()..onTap = _onTapSignUpButton,
                          ),
          
                        ]
                      ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
  void _onTapSignInButton(){

  }

  void _onTapForgotPasswordButton(){

  }


  void _onTapSignUpButton(){

  }



}
