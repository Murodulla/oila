import 'dart:async';

import 'package:flutter/material.dart';
import '../routes.dart';
import '../services/firebase/auth_service.dart';

class RegisterViewModel extends ChangeNotifier {
  final AuthService _authService = AuthService();

  final emailTextController =
      TextEditingController(text: 'example1@example.com');
  final passwordTextController = TextEditingController(text: '111111');

  Future<void> onRegisterButtonPressed(BuildContext context) async {
    final email = emailTextController.text.trim();
    final password = passwordTextController.text.trim();

    await _authService.signUpWithMailAndPassword(email, password);

    unawaited(Navigator.of(context).pushReplacementNamed(RoutesNames.home));
  }
}
