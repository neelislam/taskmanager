
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taskmanager/ui/controllers/auth_controller.dart';
import 'package:taskmanager/ui/screen/main_nav_bar_screen.dart';
import 'package:taskmanager/ui/screen/sign_in_screen.dart';
import 'package:taskmanager/ui/utils/asset_paths.dart';
import 'package:taskmanager/ui/widgets/screen_background.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  static const String name = '/';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {


  @override
  void initState(){
    super.initState();
    _moveToNextScreen(); //  2 sec wait kore ei function k auto call


  }


  Future<void> _moveToNextScreen() async{
    await Future.delayed(Duration(seconds: 2));
    bool isLoggedIn = await AuthController.isUserLoggedIn();
    if(isLoggedIn){
      Navigator.pushReplacementNamed(context, MainNavBarScreen.name );

    }
    else{
      Navigator.pushReplacementNamed(context, SignInScreen.name );

    }
  }


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: ScreenBackground(child: Center(child: SvgPicture.asset(AssetPaths.logoSvg))),
    );
  }
}
