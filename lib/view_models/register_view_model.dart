import 'dart:async';

import 'package:flutter/material.dart';

import '../providers/auth_provider.dart';

class RegisterViewModel extends ChangeNotifier {
  // final AuthService _authService = AuthService();
  final AuthProvider _authProvider = AuthProvider();

  final emailTextController =
      TextEditingController(text: 'example1@example.com');
  final passwordTextController = TextEditingController(text: '111111');

  Future<void> onRegisterButtonPressed(BuildContext context) async {
    final email = emailTextController.text.trim();
    final password = passwordTextController.text.trim();

    final success =
        await _authProvider.registerWithEmailAndPassword(email, password);
  }
}
