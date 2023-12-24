import 'package:json_annotation/json_annotation.dart';
import 'package:spadarstva/generated/locales.g.dart';

part 'settings.g.dart';

@JsonSerializable(explicitToJson: true)
class Settings {
  @JsonKey(defaultValue: LocaleKeys.en)
  String language = LocaleKeys.en;

  Settings();

  factory Settings.fromJson(Map<String, dynamic> json) =>
      _$SettingsFromJson(json);

  Map<String, dynamic> toJson() => _$SettingsToJson(this);
}
