import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:taskmanager/ui/screen/pin_verification_screen.dart';
import 'package:taskmanager/ui/screen/sign_in_screen.dart';

import '../widgets/screen_background.dart';

class SetPassword extends StatefulWidget {
  const SetPassword({super.key});
  static const String name = '/setPassword';


  @override
  State<SetPassword> createState() => _SetPasswordState();
}

class _SetPasswordState extends State<SetPassword> {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenBackground(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Form(
              key: _formKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 80,),
                  Text('Set Password', style: Theme.of(context).textTheme.titleLarge),
                  const SizedBox(height: 10,),
                  Text('Enter a password that contains more than 6 digit with special character, (a-z) and (A-Z)',
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        color: Colors.grey,
                      )),

                  const SizedBox(height: 24,),
                  TextFormField(
                      controller: _passwordController,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration( hintText:'Password',
                      ),
                  ),
                  const SizedBox(height: 5,),
                  TextFormField(
                    controller: _confirmPasswordController,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration( hintText:'Confirm password',
                    ),
                  ),
                  const SizedBox(height: 8,),
                  ElevatedButton(
                    onPressed: _onTapSubmitButton,
                    child: Icon(Icons.arrow_circle_right_outlined),
                  ),
                  const SizedBox(height: 32,),
                  Center(
                    child: RichText(text: TextSpan(
                        text: "Have an account?",
                        style: TextStyle(
                          color: Colors.black,
                          letterSpacing: 0.4,
                        ),


                        children: [

                          TextSpan(

                            text: 'Sign-in',
                            style: TextStyle(
                              color: Colors.pink,
                              fontWeight: FontWeight.w700,
                            ),
                            recognizer: TapGestureRecognizer()..onTap = _onTapSignInButton,
                          ),

                        ]
                    ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
  void _onTapSubmitButton (){
    Navigator.pushNamed(context, SignInScreen.name);
  }

  void _onTapSignInButton(){
    Navigator.pushNamed(context, SignInScreen.name);

  }

  @override
  void dispose() {
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

}

