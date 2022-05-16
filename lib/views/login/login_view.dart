import 'package:flutter/material.dart';
import 'package:oila/view_models/login_view_model.dart';
import 'package:provider/provider.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Align(
        child: SingleChildScrollView(
          child: Column(
            children: const [
              _EmailWidget(),
              SizedBox(height: 10),
              _PasswordWidget(),
              SizedBox(height: 10),
              _LoginButton(),
            ],
          ),
        ),
      ),
    );
  }
}

class _LoginButton extends StatelessWidget {
  const _LoginButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = context.read<LoginViewModel>();

    return TextButton(
      onPressed: () => model.onLoginButtonPressed(context),
      child: const Text('Login'),
    );
  }
}

class _PasswordWidget extends StatelessWidget {
  const _PasswordWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = context.read<LoginViewModel>();

    return TextField(
      controller: model.passwordTextController,
      obscureText: true,
      enableSuggestions: false,
      autocorrect: false,
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        labelText: 'password',
      ),
    );
  }
}

class _EmailWidget extends StatelessWidget {
  const _EmailWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = context.read<LoginViewModel>();

    return TextField(
      controller: model.emailTextController,
      keyboardType: TextInputType.emailAddress,
      enableSuggestions: false,
      autocorrect: false,
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        labelText: 'email',
      ),
    );
  }
}
