import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:taskmanager/ui/widgets/screen_background.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();


}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController _emailTEController = TextEditingController();
  final TextEditingController _passwordTEController = TextEditingController();
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 80,),
                  Text('Get Started With', style: Theme.of(context).textTheme.titleLarge),
                  const SizedBox(height: 24,),
                  TextFormField(
                    controller: _emailTEController,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration( hintText:'Email',
                  ),
                      validator:(String? value){
                      if(value?.isEmpty?? true){
                        return 'Enter a valid email';
                      }
                        return null;
                      }
                  ),
                  const SizedBox(height: 8,),
                  TextFormField(
                    controller: _passwordTEController,
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText:'Password',
                    ),
                      validator:(String? value){
                        if(value?.isEmpty?? true){
                          return 'Enter a valid Password';
                        }
                        return null;
                      }
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
      ),
    );
  }
  void _onTapSignInButton(){
if(_formKey.currentState!.validate()){
  //sign in with api
}
  }

  void _onTapForgotPasswordButton(){

  }


  void _onTapSignUpButton(){

  }



}
