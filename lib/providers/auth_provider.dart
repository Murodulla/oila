import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../models/user_model.dart';

enum Status {
  uninitialized,
  authenticated,
  authenticating,
  unauthenticated,
  registering
}

class AuthProvider extends ChangeNotifier {
  AuthProvider() {
    _auth = FirebaseAuth.instance;
    _auth.authStateChanges().listen(onAuthStateChanged);
  }

  late FirebaseAuth _auth;

  Status _status = Status.uninitialized;

  Status get status => _status;

  Stream<UserModel> get user => _auth.authStateChanges().map(_userFromFirebase);

  UserModel getUserSnapshot() => _userFromFirebase(_auth.currentUser);

  UserModel _userFromFirebase(User? user) {
    if (user == null) {
      return const UserModel(displayName: 'Null', uid: 'null', email: '');
    }

    return UserModel(
      uid: user.uid,
      email: user.email ?? '',
      displayName: user.displayName ?? '',
    );
  }

  //Method to detect live auth changes such as user sign in and sign out
  Future<void> onAuthStateChanged(User? firebaseUser) async {
    if (firebaseUser == null) {
      _status = Status.unauthenticated;
    } else {
      _userFromFirebase(firebaseUser);
      _status = Status.authenticated;
    }
    notifyListeners();
  }

  Future<UserModel> registerWithEmailAndPassword(
      String email, String password) async {
    try {
      _status = Status.registering;
      notifyListeners();
      final UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);

      return _userFromFirebase(result.user);
    } catch (e) {
      print('Error on the new user registration = ' + e.toString());
      _status = Status.unauthenticated;
      notifyListeners();
      return UserModel(displayName: 'Null', uid: 'null', email: '');
    }
  }

  //Method to handle user sign in using email and password
  Future<bool> signInWithEmailAndPassword(String email, String password) async {
    try {
      _status = Status.authenticating;
      notifyListeners();
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      return true;
    } catch (e) {
      print('Error on the sign in = ' + e.toString());
      _status = Status.unauthenticated;
      notifyListeners();
      return false;
    }
  }

  //Method to handle password reset email
  Future<void> sendPasswordResetEmail(String email) async {
    await _auth.sendPasswordResetEmail(email: email);
  }

  //Method to handle user signing out
  Future signOut() async {
    _auth.signOut();
    _status = Status.unauthenticated;
    notifyListeners();
    return Future.delayed(Duration.zero);
  }
}
