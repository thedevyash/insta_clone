import 'package:flutter/material.dart';
import 'package:insta_clone/models/user.dart';

class UserProvider extends ChangeNotifier {
  User? _user;
  User get getUser => _user!;
}
