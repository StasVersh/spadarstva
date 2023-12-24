import 'package:cloud_firestore/cloud_firestore.dart' hide Settings;
import 'package:json_annotation/json_annotation.dart';
import 'package:spadarstva/app/data/models/settings.dart';
import 'package:spadarstva/core/utils/converters/document_serializer.dart';
import 'package:spadarstva/core/utils/converters/settings_serializer.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  @JsonKey(includeFromJson: false, includeToJson: false)
  DocumentReference? uid;
  String? email;
  String? name;
  String? photoUrl;
  @DocumentSerializer()
  DocumentReference? group;
  @SettingsSerializer()
  Settings settings;

  User({
    this.uid,
    this.email,
    this.name,
    this.photoUrl,
    required this.settings,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
