import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../view_models/register_view_model.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({Key? key}) : super(key: key);

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
              _RegisterButton(),
            ],
          ),
        ),
      ),
    );
  }
}

class _RegisterButton extends StatelessWidget {
  const _RegisterButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = context.read<RegisterViewModel>();

    return TextButton(
      onPressed: () => model.onRegisterButtonPressed(context),
      child: const Text('Register'),
    );
  }
}

class _PasswordWidget extends StatelessWidget {
  const _PasswordWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = context.read<RegisterViewModel>();

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
    final model = context.read<RegisterViewModel>();

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
