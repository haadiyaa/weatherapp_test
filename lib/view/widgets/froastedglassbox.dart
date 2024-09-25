import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:weatherapp_zeoptic/utils/appcolors.dart.dart';

class FrostedGlassBox extends StatelessWidget {
  const FrostedGlassBox({
    super.key,
    required this.width,
    required this.height,
    required this.child,
  });

  final double width;
  final double height;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(30),
      child: Container(
        width: width,
        height: height,
        color: Colors.transparent,
        child: Stack(
          children: [
            //blur
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 4.0, sigmaY: 4.0),
              child: Container(),
            ),
            //gradient
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                border: Border.all(
                  color: MyAppColors.mainText.withOpacity(0.13),
                ),
                
                gradient: LinearGradient(
                  colors: [
                    MyAppColors.mainText.withOpacity(0.15),
                    MyAppColors.mainText.withOpacity(0.05),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
            ),
            //child
            Center(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: child,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
