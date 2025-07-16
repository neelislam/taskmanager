import 'package:email_validator/email_validator.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:taskmanager/data/service/network_caller.dart';
import 'package:taskmanager/ui/screen/fp_ur_email.dart';
import 'package:taskmanager/ui/screen/sign_up_page.dart';
import 'package:taskmanager/ui/widgets/screen_background.dart';
import 'package:taskmanager/ui/widgets/snack_bar_message.dart';

import '../../data/urls.dart';
import 'main_nav_bar_screen.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  static const String name = '/sign-in';

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController _emailTEController = TextEditingController();
  final TextEditingController _passwordTEController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _signInProgress = false;

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
                  const SizedBox(height: 80),
                  Text(
                    'Get Started With',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 24),
                  TextFormField(
                    controller: _emailTEController,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(hintText: 'Email'),
                    validator: (String? value) {
                      String email = value ?? '';

                      if (EmailValidator.validate(email) == false) {
                        return 'Enter a valid email';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 8),
                  TextFormField(
                    controller: _passwordTEController,
                    obscureText: true,
                    decoration: InputDecoration(hintText: 'Password'),
                    validator: (String? value) {
                      if ((value?.length ?? 0) < 6) {
                        return 'Enter a valid Password of minimum 7 length';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  
                  Visibility(
                    visible: _signInProgress == false,
                    replacement: Center(
                      child: CircularProgressIndicator(

                      ),
                    ),
                    child: ElevatedButton(
                      onPressed: _onTapSignInButton,
                      child: Icon(Icons.arrow_circle_right_outlined),
                    ),
                  ),
                  const SizedBox(height: 32),
                  Center(
                    child: Column(
                      children: [
                        TextButton(
                          onPressed: _onTapForgotPasswordButton,
                          child: Text(
                            'Forgot Password?',
                            style: TextStyle(color: Colors.deepOrange),
                          ),
                        ),
                        RichText(
                          text: TextSpan(
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
                                recognizer: TapGestureRecognizer()
                                  ..onTap = _onTapSignUpButton,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _onTapSignInButton() {
    if (_formKey.currentState!.validate()) {
     _signIn();

    }
  }

  Future<void> _signIn() async{
  _signInProgress = true;
  setState(() {});

  Map<String, String> requestBody ={
    "email" : _emailTEController.text.trim(),
    "password" : _passwordTEController.text.trim(),
  };

  NetworkResponse response = await NetworkCaller.postRequest(
      url: Urls.loginUrl,
  body: requestBody,);

  if(response.isSuccess){
    Navigator.pushNamedAndRemoveUntil(
      context,
      (MainNavBarScreen.name),
          (predicate) => false,      // predicate false means won't keep the before screen

    );
  } else {
    _signInProgress = false;
    setState(() {

    });
    showSnackBarMessage(context, response.errorMessage!);
  }
  }

  void _onTapForgotPasswordButton() {
    Navigator.pushNamed((context), ForgotPasswordEmailAddress.name);
  }

  void _onTapSignUpButton() {
    Navigator.pushNamed(context, SignUpScreen.name);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _emailTEController.dispose();
    _passwordTEController.dispose();
    super.dispose();
  }
}
