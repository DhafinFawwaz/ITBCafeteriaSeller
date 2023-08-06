import 'package:flutter/material.dart';
import 'package:itb_cafeteria_seller/const.dart';

class NormalButton extends StatelessWidget {
  const NormalButton({super.key, required this.text, required this.onPressed});

  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
              backgroundColor: acceptGreen,
              shadowColor: Colors.transparent,
              elevation: 0.0,
              padding: const EdgeInsets.fromLTRB(68, 10, 68, 0))
          .copyWith(elevation: ButtonStyleButton.allOrNull(0.0)),
      child: Text(
        text,
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
