import 'package:email_validator/email_validator.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:taskmanager/ui/widgets/screen_background.dart';
import 'package:taskmanager/ui/widgets/snack_bar_message.dart';

import '../../data/service/network_caller.dart';
import '../../data/urls.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  static const String name = '/sign-up';

  @override
  State<SignUpScreen> createState() => _SignUpScreenState(); // Changed to _SignUpScreenState
}

class _SignUpScreenState extends State<SignUpScreen> { // Changed class name to match
  final TextEditingController _emailTEController = TextEditingController();
  final TextEditingController _passwordTEController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _signUpInProgress = false;

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
                    'Join with us',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 24),
                  TextFormField(
                    controller: _emailTEController,
                    textInputAction: TextInputAction.next,
                    decoration: const InputDecoration(hintText: 'Email'), // Added const
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
                    controller: _firstNameController,
                    textInputAction: TextInputAction.next,
                    decoration: const InputDecoration(hintText: 'First name'), // Added const
                    validator: (String? value) { // Added validator for first name
                      if (value?.trim().isEmpty ?? true) {
                        return 'Enter your first name';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 8),
                  TextFormField(
                    controller: _lastNameController,
                    textInputAction: TextInputAction.next,
                    decoration: const InputDecoration(hintText: 'Last name'), // Added const
                    validator: (String? value) { // Added validator for last name
                      if (value?.trim().isEmpty ?? true) {
                        return 'Enter your last name';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 8),
                  TextFormField(
                    controller: _mobileController,
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(hintText: 'Mobile'), // Added const
                    validator: (String? value) { // Added validator for mobile
                      if (value?.trim().isEmpty ?? true) {
                        return 'Enter your mobile number';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 8),
                  TextFormField(
                    controller: _passwordTEController,
                    textInputAction: TextInputAction.done,
                    obscureText: true,
                    decoration: const InputDecoration(hintText: 'Password'), // Added const
                    validator: (String? value) {
                      if ((value?.length ?? 0) < 6) {
                        return 'Password must be at least 6 characters long'; // Changed message for clarity
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  // FIX: Changed _signUpInProgress = false to !_signUpInProgress for correct visibility logic
                  Visibility(
                    visible: !_signUpInProgress, // Corrected logic
                    replacement: const Center(child: CircularProgressIndicator()), // Added const
                    child: ElevatedButton(
                      onPressed: _onTapSignUpButton,
                      child: const Icon(Icons.arrow_circle_right_outlined), // Added const
                    ),
                  ),
                  const SizedBox(height: 32),
                  Center(
                    child: RichText(
                      text: TextSpan(
                        text: "Have an account?",
                        style: const TextStyle( // Added const
                          color: Colors.black,
                          letterSpacing: 0.4,
                        ),
                        children: [
                          TextSpan(
                            text: 'Sign-in',
                            style: const TextStyle( // Added const
                              color: Colors.pink,
                              fontWeight: FontWeight.w700,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = _onTapSignInButton,
                          ),
                        ],
                      ),
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

  void _onTapSignUpButton() {
    // Check if all fields are valid before proceeding with sign-up
    if (_formKey.currentState!.validate()) {
      _signUp();
    }
  }

  Future<void> _signUp() async {
    _signUpInProgress = true;
    setState(() {}); // Update UI to show progress indicator

    Map<String, String> requestBody = {
      "email": _emailTEController.text.trim(),
      "firstName": _firstNameController.text.trim(),
      "lastName": _lastNameController.text.trim(),
      "mobile": _mobileController.text.trim(),
      "password": _passwordTEController.text,
    };

    NetworkResponse response = await NetworkCaller.postRequest(
      url: Urls.registrationUrl,
      body: requestBody,
    );

    _signUpInProgress = false;
    setState(() {}); // Update UI to hide progress indicator

    if (response.isSuccess) {
      _clearTextField();
      showSnackBarMessage(
        context,
        'Registration has been successful. Please login', // Corrected typo
      );
    } else {
      showSnackBarMessage(context, response.errorMessage ?? 'Registration failed! Please try again.'); // Added fallback error message
    }
  }

  void _clearTextField() {
    _firstNameController.clear();
    _lastNameController.clear();
    _emailTEController.clear();
    _mobileController.clear(); // Added mobile clear
    _passwordTEController.clear();
  }

  void _onTapSignInButton() {
    Navigator.pop(context);
  }

  @override
  void dispose() {
    _mobileController.dispose();
    _lastNameController.dispose();
    _firstNameController.dispose();
    _emailTEController.dispose();
    _passwordTEController.dispose();
    super.dispose();
  }
}
