import 'package:email_validator/email_validator.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:taskmanager/ui/screen/sign_in_screen.dart';
import '../widgets/screen_background.dart';

class ForgotPasswordEmailAddress extends StatefulWidget {
  const ForgotPasswordEmailAddress({super.key});
  static const String name = '/ForgotPasswordEA';
  @override
  State<ForgotPasswordEmailAddress> createState() =>
      _ForgotPasswordEmailAddressState();
}
class _ForgotPasswordEmailAddressState extends State<ForgotPasswordEmailAddress> {
  final TextEditingController _emailController = TextEditingController();
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
                  Text('Your Email Address', style: Theme.of(context).textTheme.titleLarge),
                  const SizedBox(height: 10,),
                  Text('A 6 digit code will send to your email address',
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        color: Colors.grey,
                      )),

                  const SizedBox(height: 24,),
                  TextFormField(
                      controller: _emailController,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration( hintText:'Email',
                      ),
                      validator:(String? value){
                        String email = value ?? '';

                        if(EmailValidator.validate(email) == false){
                          return 'Enter a valid email';
                        }
                        return null;
                      }
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

  }

  void _onTapSignInButton(){
    Navigator.pushNamed(context, SignInScreen.name);

  }

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

}





