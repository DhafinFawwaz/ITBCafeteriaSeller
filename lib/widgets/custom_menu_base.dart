import 'package:flutter/material.dart';
import 'package:itb_cafeteria_seller/utils/GlobalTheme.dart';

import 'floating_back_button.dart';

class CustomMenuBase extends StatelessWidget {
  const CustomMenuBase({super.key, required this.hoveringChild, required this.child});

  final Widget hoveringChild;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 80, left: GlobalTheme.padding1, right: GlobalTheme.padding1),
            child: hoveringChild,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 160, bottom: 0),
            child: child,
          ),
        ],
      )
    );
  }
}