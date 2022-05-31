import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../routes.dart';
import '../../view_models/home_view_model.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var user = FirebaseAuth.instance.currentUser;

    HomeViewModel viewModel = context.read<HomeViewModel>();

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: viewModel.onSignOutButtonPressed,
            icon: const Icon(Icons.logout),
          )
        ],
        title: const Text('Oila'),
      ),
      body: Align(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text('${user?.email}'),
              Text('${user?.displayName}'),
              Text('${user?.uid}'),
              const SizedBox(height: 20),
              TextField(
                controller: viewModel.nameTextController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => viewModel.onSaveButtonPressedTemplate(user),
                child: const Text('SaveTemp'),
              ),
              ElevatedButton(
                onPressed: viewModel.onLoadButtonPressed,
                child: const Text('Load'),
              ),
              ElevatedButton(
                onPressed: () =>
                    Navigator.of(context).pushNamed(RoutesNames.familyTree),
                child: Text('data'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
