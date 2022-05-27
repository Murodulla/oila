import 'package:cloud_firestore/cloud_firestore.dart';

import '../../models/user_model.dart';
import '../base.service.dart';

class FirestoreService extends BaseService {
  CollectionReference usersCollection =
      FirebaseFirestore.instance.collection('users');

  Stream<QuerySnapshot> getStream() {
    return usersCollection.snapshots();
  }

  Future<void> updateUser(UserModel user) async {
    await usersCollection.doc(user.referenceId).update(user.toJson());
  }

  Future<void> deleteUser(UserModel user) async {
    await usersCollection.doc(user.referenceId).delete();
  }

  Future<DocumentReference> addUser(UserModel user) async {
    return usersCollection.add(user.toJson());
  }

//
  Future<void> createUser(UserModel user) async {
    try {
      await usersCollection.doc(user.referenceId).set(user.toJson());
    } catch (e) {
      print(e);
    }
  }

  Future<void> readUsers() async {
    await usersCollection.get().then((event) {
      for (var doc in event.docs) {
        print('${doc.id} => ${doc.data()}');
      }
    });
  }
}
