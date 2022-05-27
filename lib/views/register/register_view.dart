import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';
import 'package:provider/provider.dart';

import '../../routes.dart';
import '../../view_models/register_view_model.dart';

class RegisterView extends StatelessWidget {
  RegisterView({Key? key}) : super(key: key);

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
                _RegisterButtonWidget(formKey: _formKey),
                const SizedBox(height: 10),
                const _LoginRouterWidget(),
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
    final viewModel = context.read<RegisterViewModel>();

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
    final viewModel = context.read<RegisterViewModel>();

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

class _RegisterButtonWidget extends StatelessWidget {
  const _RegisterButtonWidget({
    required this.formKey,
    Key? key,
  }) : super(key: key);

  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<RegisterViewModel>();

    return ElevatedButton(
      onPressed: () {
        if (formKey.currentState!.validate()) {
          viewModel.onRegisterButtonPressed(context).then(
                (value) => Navigator.of(context)
                    .pushReplacementNamed(AppRouter.initialRoute),
              );
        }
      },
      child: const Text('Register'),
    );
  }
}

class _LoginRouterWidget extends StatelessWidget {
  const _LoginRouterWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () =>
          Navigator.of(context).pushReplacementNamed(RoutesNames.login),
      child: const Text('Login'),
    );
  }
}
