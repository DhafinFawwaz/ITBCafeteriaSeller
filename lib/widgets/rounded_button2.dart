import 'package:flutter/material.dart';

import '../utils/GlobalTheme.dart';

class RoundedButton2 extends StatelessWidget {
  const RoundedButton2 ({super.key, required this.text, required this.borderRadius, this.backgroundColor = GlobalTheme.slate700, this.textColor = Colors.white, required this.onPressed, this.height = 18, this.width = 40});

  final String text;
  final BorderRadius borderRadius;
  final Color? backgroundColor;
  final Color? textColor;
  final VoidCallback onPressed;
  final double height;
  final double width;


  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      
      style: ElevatedButton.styleFrom(
        shadowColor: Colors.transparent,
        backgroundColor: backgroundColor,
        elevation: 0.0,
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        shape: RoundedRectangleBorder(
          borderRadius: borderRadius,
        ),
      ).copyWith(
          elevation: ButtonStyleButton.allOrNull(0.0)
      ),
      child: Container(
        height: height,
        width: width,
        child: Center(
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: textColor
            ),
          ),
        ),
      ),
    );
  }
}