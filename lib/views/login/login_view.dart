import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';
import 'package:provider/provider.dart';

import '../../routes.dart';
import '../../view_models/login_view_model.dart';

class LoginView extends StatelessWidget {
  LoginView({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Align(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const _EmailWidget(),
                const SizedBox(height: 10),
                const _PasswordWidget(),
                const SizedBox(height: 10),
                // _LoginButtonWidget(),
                _LoginButtonWidget(formKey: _formKey),
                const SizedBox(height: 10),
                const _RegisterRouterWidget(),
              ],
            ),
          ),
        ),
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
    final viewModel = context.read<LoginViewModel>();

    return TextFormField(
      controller: viewModel.emailTextController,
      keyboardType: TextInputType.emailAddress,
      enableSuggestions: false,
      autocorrect: false,
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        labelText: 'email',
      ),
      validator: ValidationBuilder().email().build(),
    );
  }
}

class _PasswordWidget extends StatelessWidget {
  const _PasswordWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<LoginViewModel>();

    return TextFormField(
      controller: viewModel.passwordTextController,
      obscureText: true,
      enableSuggestions: false,
      autocorrect: false,
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        labelText: 'password',
      ),
      validator: ValidationBuilder().minLength(6).build(),
    );
  }
}

class _LoginButtonWidget extends StatelessWidget {
  const _LoginButtonWidget({
    required GlobalKey<FormState> formKey,
    Key? key,
  })  : _formKey = formKey,
        super(key: key);

  final GlobalKey<FormState> _formKey;

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<LoginViewModel>();

    return ElevatedButton(
      onPressed: () {
        if (_formKey.currentState!.validate()) {
          viewModel.onLoginButtonPressed();
        }
      },
      child: const Text('Login'),
    );
  }
}

class _RegisterRouterWidget extends StatelessWidget {
  const _RegisterRouterWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () =>
          Navigator.of(context).pushReplacementNamed(RoutesNames.register),
      child: const Text('Register'),
    );
  }
}
