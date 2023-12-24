import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart' hide Settings;
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:get/get.dart';
import 'package:spadarstva/app/data/models/settings.dart';
import 'package:spadarstva/app/data/models/user.dart';
import 'package:spadarstva/app/data/services/auth_services.dart';

class UserServices extends GetxService {
  final FirebaseFirestore firestore;
  late CollectionReference<User> userCollection;
  User? _currentUser;

  User? get currentUser => _currentUser;

  UserServices(this.firestore);

  Future<UserServices> init() async {
    userCollection = firestore.collection('users').withConverter<User>(
        fromFirestore: (snapshot, _) =>
            User.fromJson(snapshot.data()!)..uid = snapshot.reference,
        toFirestore: (user, _) => user.toJson());
    var authUser = Get.find<AuthServices>().getCurrentAuthUser();

    await setCurrentUser(authUser?.uid);
    return this;
  }

  Future setCurrentUser(String? uid) async {
    if (uid == null) {
      return;
    }
    var doc = await userCollection.doc(uid).get();
    _currentUser = doc.data();
    var snapshot = userCollection.doc(uid).snapshots();
    snapshot.listen((event) {
      _currentUser = event.data();
    });
  }

  Future addUser(auth.User authUser) async {
    var doc = await userCollection.doc(authUser.uid).get();
    var userExist = doc.data() != null;
    if (!userExist) {
      await userCollection.doc(authUser.uid).set(User(
          name: authUser.displayName,
          email: authUser.email,
          photoUrl: authUser.photoURL,
          settings: Settings()));
    }
  }

  Future<User?> getUser(String? uid) async {
    if (uid == null) {
      return null;
    }
    var doc = await userCollection.doc(uid).get();
    return doc.exists ? doc.data() : null;
  }

  DocumentReference getUserReference(String uid) {
    return userCollection.doc(uid);
  }

  void cleanUser() {
    _currentUser = null;
  }

  Future updateUser(User user) async {
    await userCollection.doc(user.uid!.id).update(user.toJson());
  }

  Future deleteUser(String? uid) async {
    if (uid == null) {
      return null;
    }
    await userCollection.doc(uid).delete();
  }
}
