import 'package:flutter/material.dart';
import 'package:insta_clone/utils/dimensons.dart';

class ResponsiveLayout extends StatelessWidget {
  Widget WebScreenLayout;
  Widget MobileScreenLayout;
  ResponsiveLayout(
      {super.key,
      required this.WebScreenLayout,
      required this.MobileScreenLayout});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > webScreenSize) {
          return WebScreenLayout;
        } else {
          return MobileScreenLayout;
        }
      },
    );
  }
}
