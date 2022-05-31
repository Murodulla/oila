import 'package:flutter/material.dart';

import 'auth_wrapper.dart';
import 'views/family_tree/family_tree_view.dart';
import 'views/home/home_view.dart';
import 'views/login/login_view.dart';
import 'views/register/register_view.dart';

abstract class RoutesNames {
  static const home = '/';
  static const addMember = '/add_member';
  static const login = 'login';
  static const register = 'register';
  static const authWrapper = 'auth_wrapper';
  static const familyTree = '/user/family_tree';
}

/// [AppRouter]
/// This the base router classes where you can registered
/// and customize all the named routes of your app
mixin AppRouter {
  static const initialRoute = RoutesNames.authWrapper;

  static Route<dynamic>? generateRoute(RouteSettings settings) {
    final _arguments = settings.arguments;

    switch (settings.name) {
      case RoutesNames.authWrapper:
        return MaterialPageRoute(
          builder: (context) => const AuthWrapper(),
        );
      case RoutesNames.login:
        return MaterialPageRoute(
          builder: (context) => LoginView(),
        );
      case RoutesNames.register:
        return MaterialPageRoute(
          builder: (context) => RegisterView(),
        );
      case RoutesNames.home:
        return MaterialPageRoute(
          builder: (context) => const HomeView(),
        );
      case RoutesNames.familyTree:
        return MaterialPageRoute(
          builder: (context) => const FamilyTreeView(),
        );
      default:
        throw const FormatException('Route not found');
    }
  }
}
