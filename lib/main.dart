import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'firebase_options.dart';
import 'helpers/theme.dart';
import 'routes.dart';
import 'view_models/home_view_model.dart';
import 'view_models/login_view_model.dart';
import 'view_models/register_view_model.dart';
import 'views/home/home.view.dart';
import 'views/login/login_view.dart';
import 'views/register/register_view.dart';

/// [globalInitializer()]
/// Function to initialise all the pre-app things
globalInitializer() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}

void main() async {
  await globalInitializer();
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        /// Here you should register the ViewModels you want to use across many screens with
        /// the WideScopeBaseView
        ChangeNotifierProvider<LoginViewModel>(
          create: (context) => LoginViewModel(),
          child: const LoginView(),
        ),
        ChangeNotifierProvider<RegisterViewModel>(
          create: (context) => RegisterViewModel(),
          child: RegisterView(),
        ),
        ChangeNotifierProvider<HomeViewModel>(
          create: (context) => HomeViewModel(),
          child: const HomeView(),
        ),

        /// You should register yoyr providers here too
      ],
      child: MaterialApp(
        title: 'Oila',
        theme: appTheme,
        initialRoute: AppRouter.initialRoute,
        onGenerateRoute: (settings) => AppRouter.generateRoute(settings),
      ),
    );
  }
}
