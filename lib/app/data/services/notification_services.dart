import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart' hide Settings;
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:get/get.dart';
import 'package:spadarstva/app/data/models/group.dart';
import 'package:spadarstva/app/data/models/notification.dart';
import 'package:spadarstva/app/data/models/settings.dart';
import 'package:spadarstva/app/data/models/user.dart';
import 'package:spadarstva/app/data/services/auth_services.dart';

class NotificationServices extends GetxService {
  final FirebaseFirestore firestore;
  late CollectionReference<Notification> collection;

  NotificationServices(this.firestore);

  Future<NotificationServices> init() async {
    collection = firestore
        .collection('notifications')
        .withConverter<Notification>(
            fromFirestore: (snapshot, _) =>
                Notification.fromJson(snapshot.data()!)
                  ..uid = snapshot.reference,
            toFirestore: (group, _) => group.toJson());
    return this;
  }

  Future<List<Notification>> getNotifications(DocumentReference userTo) async {
    var doc = await collection.where('userTo', isEqualTo: userTo).get();
    return doc.docs.isNotEmpty
        ? doc.docs.map((doc) => doc.data()).toList()
        : [];
  }

  Future<DocumentReference<Notification>> addGroup(
      Notification notification) async {
    return await collection.add(notification);
  }
}
