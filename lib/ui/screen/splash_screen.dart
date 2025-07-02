
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taskmanager/ui/screen/sign_in_screen.dart';
import 'package:taskmanager/ui/utils/asset_paths.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {


  @override
  void initState(){
    super.initState();
    _moveToNextScreen(); // ashlei 2 sec wait kore ei function k auto call dibe


  }


  Future<void> _moveToNextScreen() async{
    await Future.delayed(Duration(seconds: 3)); // 2 sec wait kore onno screen e jabe
    //kivabe? Navigator push use kroe
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SignInScreen()));
  }


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Stack(
        children: [
          SvgPicture.asset(AssetPaths.backgroundSvg, fit: BoxFit.cover,
            height: double.maxFinite,
            width: double.maxFinite,),
          Align(
              alignment: Alignment.center,
              child: SvgPicture.asset(AssetPaths.logoSvg)),

        ],
      ),
    );
  }
}
