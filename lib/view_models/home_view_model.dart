import 'package:flutter/material.dart';

import '../models/user_model.dart';
import '../services/firebase/auth_service.dart';
import '../services/firebase/firestore_service.dart';

class HomeViewModel extends ChangeNotifier {
  final _auth = AuthService().user;
  final FirestoreService _firestoreService = FirestoreService();
  final _userModel = const UserModel(name: '', referenceId: '');
  final nameTextController = TextEditingController(text: 'Ismsiz kishi');

  Future<void> onSaveButtonPressed() async {
    final user = _userModel.copyWith(
      name: nameTextController.text,
      referenceId: _auth!.uid,
    );

    await _firestoreService.createUser(user);
  }

  Future<void> onLoadButtonPressed() async {
    await _firestoreService.readUsers();
  }
}
