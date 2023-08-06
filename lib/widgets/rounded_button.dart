import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  RoundedButton(
      {super.key,
      required this.text,
      required this.borderRadius,
      required this.color,
      required this.onPressed,
      this.pad,
      required this.height,
      this.textSize,
      required this.width});

  double? textSize = 16;
  double height = 39;
  double width = 178;
  EdgeInsetsGeometry? pad =
      const EdgeInsets.symmetric(vertical: 10, horizontal: 15);
  final String text;
  final BorderRadius borderRadius;
  final Color color;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        shadowColor: Colors.transparent,
        backgroundColor: color,
        elevation: 3,
        padding: pad,
        minimumSize: Size(width, height),
        shape: RoundedRectangleBorder(
          borderRadius: borderRadius,
        ),
      ),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(
            color: Colors.white,
            fontSize: textSize,
            fontWeight: FontWeight.w400),
      ),
    );
  }
}
