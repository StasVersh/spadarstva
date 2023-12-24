import 'package:json_annotation/json_annotation.dart';
import 'package:spadarstva/app/data/models/settings.dart';

class SettingsSerializer
    implements JsonConverter<Settings, Map<String, dynamic>> {
  const SettingsSerializer();

  @override
  Settings fromJson(Map<String, dynamic> data) => Settings.fromJson(data);

  @override
  Map<String, dynamic> toJson(Settings model) => model.toJson();
}
