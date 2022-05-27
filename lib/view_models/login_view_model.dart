import 'dart:async';

import 'package:flutter/material.dart';

import '../providers/auth_provider.dart';

class LoginViewModel extends ChangeNotifier {
  // final AuthService _authService = AuthService();
  final AuthProvider _authProvider = AuthProvider();

  final emailTextController =
      TextEditingController(text: 'example@example.com');
  final passwordTextController = TextEditingController(text: '111111');

  Future<void> onLoginButtonPressed() async {
    final email = emailTextController.text.trim();
    final password = passwordTextController.text.trim();

    // await _authService.signInWithMailAndPassword(email, password);
    final success =
        await _authProvider.signInWithEmailAndPassword(email, password);
  }
}
