import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:spadarstva/app/data/models/notification_type.dart';
import 'package:spadarstva/core/utils/converters/document_serializer.dart';

part 'notification.g.dart';

@JsonSerializable()
class Notification {
  @JsonKey(includeFromJson: false, includeToJson: false)
  DocumentReference? uid;
  @DocumentSerializer()
  DocumentReference userTo;
  NotificationType type;

  Notification({this.uid, required this.userTo, required this.type});

  factory Notification.fromJson(Map<String, dynamic> json) =>
      _$NotificationFromJson(json);

  Map<String, dynamic> toJson() => _$NotificationToJson(this);
}
