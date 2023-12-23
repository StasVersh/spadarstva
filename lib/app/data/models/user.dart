import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  @JsonKey(includeFromJson: false, includeToJson: false)
  DocumentReference? uid;
  String? email;
  String? name;
  String? photoUrl;

  User({this.uid, this.email, this.name, this.photoUrl});

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
