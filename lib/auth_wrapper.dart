import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'providers/auth_provider.dart';
import 'views/home/home_view.dart';
import 'views/login/login_view.dart';

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(
      builder: (context, value, child) {
        switch (value.status) {
          case Status.uninitialized:
            return const Center(
              child: CircularProgressIndicator(),
            );
          case Status.authenticated:
            return const HomeView();

          case Status.registering:
          case Status.authenticating:
          case Status.unauthenticated:
            return LoginView();

          default:
            break;
        }
        return const Center(
          child: Text('Error'),
        );
      },
    );
  }
}
