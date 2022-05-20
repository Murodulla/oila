import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../services/firebase/auth_service.dart';
import '../../view_models/home_view_model.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<HomeViewModel>();
    final user = AuthService().user;

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () async => AuthService().signOut(null)
            // (() {
            //   Navigator.of(context).pushReplacementNamed(RoutesNames.register);
            // })
            ,
            icon: const Icon(Icons.logout),
          )
        ],
        title: const Text('Oila'),
      ),
      body: Column(
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
            onPressed: viewModel.onSaveButtonPressed,
            child: const Text('Save'),
          ),
          ElevatedButton(
            onPressed: viewModel.onLoadButtonPressed,
            child: const Text('Load'),
          )
        ],
      ),
    );
  }
}
