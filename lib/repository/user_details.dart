import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserDetail {
  User? user;
  BuildContext context;
  static String? imageUrl;
  static String? userName;
  UserDetail({this.user, required this.context});

  getUserDetail() {
    final user = Provider.of<User?>(context);
    imageUrl = user?.photoURL;
    userName = user?.displayName;
  }
}
