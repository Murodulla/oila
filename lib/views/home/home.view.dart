import 'package:flutter/material.dart';

import '../../services/firebase/auth_service.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
        ],
      ),
    );
  }
}
