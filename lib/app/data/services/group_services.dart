import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart' hide Settings;
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:get/get.dart';
import 'package:spadarstva/app/data/models/group.dart';
import 'package:spadarstva/app/data/models/settings.dart';
import 'package:spadarstva/app/data/models/user.dart';
import 'package:spadarstva/app/data/services/auth_services.dart';

class GroupServices extends GetxService {
  final FirebaseFirestore firestore;
  late CollectionReference<Group> collection;

  GroupServices(this.firestore);

  Future<GroupServices> init() async {
    collection = firestore.collection('groups').withConverter<Group>(
        fromFirestore: (snapshot, _) =>
            Group.fromJson(snapshot.data()!)..uid = snapshot.reference,
        toFirestore: (group, _) => group.toJson());
    return this;
  }

  Future<Group> getGroup(String uid) async {
    var doc = await collection.doc(uid).get();
    return doc.data()!;
  }

  Future<DocumentReference<Group>> addGroup(Group group) async {
    return await collection.add(group);
  }

  Future bunUserFromGroup(Group group, User user) async {
    if (group.users.length > 1) {
      group.users.remove(user.uid);
      await collection.doc(group.uid!.id).update(group.toJson());
    } else {
      await collection.doc(group.uid!.id).delete();
    }
  }
}
