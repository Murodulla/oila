import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../models/user_model.dart';
import '../providers/auth_provider.dart';
import '../services/firebase/firestore_service.dart';

class HomeViewModel extends ChangeNotifier {
  // late FirebaseAuth _auth;
  // late User? _user;
  HomeViewModel() {
    // _auth = FirebaseAuth.instance;
    // _user.authStateChanges().listen(onAuthStateChanged);
    // _user = _auth.currentUser;
    print('-----------homeviewmodel construcotr');
  }

  final AuthProvider _authProvider = AuthProvider();
  final FirestoreService _firestoreService = FirestoreService();

  User? _currentUser = FirebaseAuth.instance.currentUser;
  final nameTextController = TextEditingController();

  Future<void> onSaveButtonPressedTemplate(User? user) async {
    UserModel userModel = UserModel(
      uid: user!.uid,
      email: user.email!,
      displayName: nameTextController.text,
    );

    await _firestoreService.createUser(userModel);
  }

  Future<void> onSaveButtonPressed() async {
    UserModel userModel = UserModel(
      uid: _currentUser!.uid,
      email: _currentUser!.email ?? '',
      displayName: nameTextController.text,
    );

    await _firestoreService.createUser(userModel);
  }

  Future<void> onLoadButtonPressed() async {
    await _firestoreService.readUsers();
  }

  Future<void> onSignOutButtonPressed() async {
    await _authProvider.signOut();
    notifyListeners();
  }
}
