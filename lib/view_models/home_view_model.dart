import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../models/user_model.dart';
import '../services/firebase/firestore_service.dart';

class HomeViewModel extends ChangeNotifier {
  final FirestoreService _firestoreService = FirestoreService();
  final nameTextController = TextEditingController(text: 'Ismsiz kishi');

  Future<void> onSaveButtonPressed(User? user) async {
    UserModel userModel = UserModel(
      name: nameTextController.text,
      referenceId: user!.uid,
    );

    await _firestoreService.createUser(userModel);
  }

  Future<void> onLoadButtonPressed() async {
    await _firestoreService.readUsers();
  }
}
