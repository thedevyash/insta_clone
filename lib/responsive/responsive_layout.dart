import 'package:flutter/material.dart';
import 'package:insta_clone/providers/user_provider.dart';
import 'package:insta_clone/utils/dimensons.dart';
import 'package:provider/provider.dart';

class ResponsiveLayout extends StatefulWidget {
  Widget WebScreenLayout;
  Widget MobileScreenLayout;
  ResponsiveLayout(
      {super.key,
      required this.WebScreenLayout,
      required this.MobileScreenLayout});

  @override
  State<ResponsiveLayout> createState() => _ResponsiveLayoutState();
}

class _ResponsiveLayoutState extends State<ResponsiveLayout> {
  @override
  void initState() {
    super.initState();
    addData();
  }

  void addData() async {
    UserProvider _userProvider = Provider.of(context, listen: false);
    await _userProvider.refreshUser();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > webScreenSize) {
          return widget.WebScreenLayout;
        } else {
          return widget.MobileScreenLayout;
        }
      },
    );
  }
}
