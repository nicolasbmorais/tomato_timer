import 'dart:convert';

class UserSettingsModel {
  UserSettingsModel({
    this.showCompleteNotification,
    this.focusDuration,
    this.longBreak,
    this.shortBreak,
    this.timerSound,
  });

  factory UserSettingsModel.fromRawJson(String str) =>
      UserSettingsModel.fromJson(json.decode(str) as Map<String, dynamic>);

  factory UserSettingsModel.fromJson(Map<String, dynamic> json) =>
      UserSettingsModel(
        showCompleteNotification: json['showCompleteNotification'] as bool,
        focusDuration: json['focusDuration'] as int,
        longBreak: json['longBreak'] as int,
        shortBreak: json['shortBreak'] as int,
        timerSound: json['timerSound'] as String,
      );

  factory UserSettingsModel.empty() {
    return UserSettingsModel(
      showCompleteNotification: false,
      focusDuration: 5,
      longBreak: 10,
      shortBreak: 5,
      timerSound: '',
    );
  }

  bool? showCompleteNotification;
  int? focusDuration;
  int? longBreak;
  int? shortBreak;
  String? timerSound;

  String toRawJson() => json.encode(toJson());

  Map<String, dynamic> toJson() => {
        'showCompleteNotification': showCompleteNotification,
        'focusDuration': focusDuration,
        'longBreak': longBreak,
        'shortBreak': shortBreak,
        'timerSound': timerSound,
      };
}
