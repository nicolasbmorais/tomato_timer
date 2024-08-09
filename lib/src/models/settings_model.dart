import 'dart:convert';

class UserSettingsModel {
  UserSettingsModel({
    this.showCompleteNotification,
    this.focusDuration,
    this.shortBreak,
    this.longBreak,
    this.timerSound,
  });

  factory UserSettingsModel.fromRawJson(String str) =>
      UserSettingsModel.fromJson(json.decode(str) as Map<String, dynamic>);

  factory UserSettingsModel.fromJson(Map<String, dynamic> json) =>
      UserSettingsModel(
        showCompleteNotification: json['showCompleteNotification'] as bool,
        focusDuration: json['focusDuration'] as int,
        shortBreak: json['shortBreak'] as int,
        longBreak: json['longBreak'] as int,
        timerSound: json['timerSound'] as String,
      );

  factory UserSettingsModel.empty() {
    return UserSettingsModel(
      showCompleteNotification: false,
      focusDuration: 5,
      shortBreak: 5,
      longBreak: 10,
      timerSound: '',
    );
  }

  bool? showCompleteNotification;
  int? focusDuration;
  int? shortBreak;
  int? longBreak;
  String? timerSound;

  String toRawJson() => json.encode(toJson());

  Map<String, dynamic> toJson() => {
        'showCompleteNotification': showCompleteNotification,
        'focusDuration': focusDuration,
        'shortBreak': shortBreak,
        'longBreak': longBreak,
        'timerSound': timerSound,
      };
}
