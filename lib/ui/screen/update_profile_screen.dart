import 'package:email_validator/email_validator.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../widgets/screen_background.dart';

class UpdateProfileScreen extends StatefulWidget {
  const UpdateProfileScreen({super.key});
  static const String name = '/Update-profile-screen';

  @override
  State<UpdateProfileScreen> createState() => _UpdateProfileScreenState();
}

class _UpdateProfileScreenState extends State<UpdateProfileScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
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
                  Text('Join with us', style: Theme.of(context).textTheme.titleLarge),
                  const SizedBox(height: 24,),
                  TextFormField(

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
                  TextFormField(
                    controller: _firstNameController,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration( hintText:'First name',
                    ),
                  ),
                  const SizedBox(height: 8,),
                  TextFormField(
                    controller: _lastNameController,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration( hintText:'Last name',
                    ),
                  ),
                  const SizedBox(height: 8,),
                  TextFormField(
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText:'Mobile',
                    ),
                  ),
                  const SizedBox(height: 8,),
                  TextFormField(
                      textInputAction: TextInputAction.done,
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText:'Password',
                      ),
                      validator:(String? value){
                        if((value?.length ?? 0)< 6){
                          return 'Enter a valid Password of minimum 7 length';
                        }
                        return null;
                      }
                  ),
                  const SizedBox(height: 16,),
                  ElevatedButton(
                    onPressed: (){},
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
                            recognizer: TapGestureRecognizer()..onTap = (){},
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
}
