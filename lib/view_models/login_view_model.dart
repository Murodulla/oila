import 'dart:async';

import 'package:flutter/material.dart';
import '../routes.dart';
import '../services/firebase/auth_service.dart';

class LoginViewModel extends ChangeNotifier {
  final AuthService _authService = AuthService();

  final emailTextController =
      TextEditingController(text: 'example@example.com');
  final passwordTextController = TextEditingController(text: '111111');

  Future<void> onLoginButtonPressed(BuildContext context) async {
    final email = emailTextController.text.trim();
    final password = passwordTextController.text.trim();

    bool isLoggedId =
        await _authService.signInWithMailAndPassword(email, password);

    if (isLoggedId) {
      unawaited(Navigator.of(context).pushReplacementNamed(RoutesNames.home));
    }
  }
}
