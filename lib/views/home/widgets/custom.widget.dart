import 'package:flutter/material.dart';

import '../../../routes.dart';
import '../../../services/firebase/auth_service.dart';

class CustomWidget extends StatelessWidget {
  const CustomWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "This is a custom widget",
        ),
        ElevatedButton(
          onPressed: () {
            AuthService().signOut(() {
              Navigator.of(context).pushReplacementNamed(RoutesNames.register);
            });
          },
          child: Text('data'),
        ),
      ],
    );
  }
}
