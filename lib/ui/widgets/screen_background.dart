import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../utils/asset_paths.dart';
class ScreenBackground extends StatelessWidget {
  const ScreenBackground({super.key, required this.child});
 final Widget child;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SvgPicture.asset(AssetPaths.backgroundSvg, fit: BoxFit.cover,
          height: double.maxFinite,
          width: double.maxFinite,),
        SafeArea(child: child),
      ],
    );
  }
}
