import 'package:flutter/material.dart';

class InkWellButton extends StatelessWidget {
  const InkWellButton({super.key, required this.onPressed, required this.child});

  final Widget child;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.grey[300],
      borderRadius: BorderRadius.circular(15),
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(20),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
          ),
          alignment: Alignment.centerLeft,
          child: child,
        ),
      ),
    );
  }
}