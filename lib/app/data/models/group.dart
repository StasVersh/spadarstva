import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:spadarstva/core/utils/converters/document_serializer.dart';

part 'group.g.dart';

@JsonSerializable()
class Group {
  @JsonKey(includeFromJson: false, includeToJson: false)
  DocumentReference? uid;
  @DocumentSerializer()
  List<DocumentReference> users;

  Group({this.uid, required this.users});

  factory Group.fromJson(Map<String, dynamic> json) => _$GroupFromJson(json);

  Map<String, dynamic> toJson() => _$GroupToJson(this);
}
