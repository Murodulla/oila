import 'package:flutter/material.dart';
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
          // TODO: Validator qo'shish kerak reg va logga
          child: Form(
            key: _formKey,
            child: Column(
              children: const [
                _EmailWidget(),
                SizedBox(height: 10),
                _PasswordWidget(),
                SizedBox(height: 10),
                _RegisterButtonWidget(),
                SizedBox(height: 10),
                _LoginRouterWidget(),
              ],
            ),
          ),
        ),
      ),
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

class _RegisterButtonWidget extends StatelessWidget {
  const _RegisterButtonWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<RegisterViewModel>();
    // TODO: registerda mavjudi register qilinsa authwrapperga o'tyapti (login pagega) va keyin login bo'lmayapti. Saqlash kerak agar registered bo'lsa.
    return ElevatedButton(
      onPressed: () => viewModel.onRegisterButtonPressed(context).then(
            (value) => Navigator.of(context)
                .pushReplacementNamed(AppRouter.initialRoute),
          ),
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
    final viewModel = context.read<RegisterViewModel>();

    return TextField(
      controller: viewModel.passwordTextController,
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
    final viewModel = context.read<RegisterViewModel>();

    return TextField(
      controller: viewModel.emailTextController,
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
