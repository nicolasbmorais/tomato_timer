import 'dart:convert';

class UserSettingsModel {
  UserSettingsModel({
    this.focusDuration,
    this.shortBreak,
    this.longBreak,
    this.timerSound,
    this.showCompleteNotification,
    this.restartAutomatically,
  });

  factory UserSettingsModel.fromRawJson(String str) =>
      UserSettingsModel.fromJson(json.decode(str) as Map<String, dynamic>);

  factory UserSettingsModel.fromJson(Map<String, dynamic> json) =>
      UserSettingsModel(
        focusDuration: json['focusDuration'] as int,
        shortBreak: json['shortBreak'] as int,
        longBreak: json['longBreak'] as int,
        timerSound: json['timerSound'] as String,
        showCompleteNotification: json['showCompleteNotification'] as bool,
        restartAutomatically: json['restartAutomatically'] as bool,
      );

  factory UserSettingsModel.empty() {
    return UserSettingsModel(
      focusDuration: 5,
      shortBreak: 5,
      longBreak: 10,
      timerSound: '',
      showCompleteNotification: false,
      restartAutomatically: false,
    );
  }

  int? focusDuration;
  int? shortBreak;
  int? longBreak;
  String? timerSound;
  bool? showCompleteNotification;
  bool? restartAutomatically;

  String toRawJson() => json.encode(toJson());

  Map<String, dynamic> toJson() => {
        'focusDuration': focusDuration,
        'shortBreak': shortBreak,
        'longBreak': longBreak,
        'timerSound': timerSound,
        'showCompleteNotification': showCompleteNotification,
        'restartAutomatically': restartAutomatically,
      };
}
