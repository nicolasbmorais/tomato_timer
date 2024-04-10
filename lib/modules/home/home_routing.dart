import 'package:flutter_modular/flutter_modular.dart';
import 'package:tomato_timer/modules/config/presentation/pages/config_page.dart';
import 'package:tomato_timer/modules/home/features/delete_notes_page.dart';
import 'package:tomato_timer/modules/home/features/initial_page.dart';
import 'package:tomato_timer/modules/home/features/notes_page.dart';
import 'package:tomato_timer/modules/home/features/settings_page.dart';
import 'package:tomato_timer/modules/home/features/take_long_break.dart';
import 'package:tomato_timer/modules/home/features/take_short_break.dart';
import 'package:tomato_timer/modules/home/home.dart';

class HomeRouting {
  static String get initial => '/';
  static String get homePage => '/home';
  static String get notesPage => '/notes';
  static String get configPage => '/config';
  static String get deleteNotesPage => '/deleteNotes';
  static String get shortBreakPage => '/shortBreakPage';
  static String get longBreakPage => '/longBreakPage';
  static String get settingsPage => '/settingsPage';

  /// Rotas do módulo
  static void routes(RouteManager r) {
    r
      ..child(initial, child: (context) => const InitialPage())
      ..child(homePage, child: (context) => const HomePage())
      ..child(configPage, child: (context) => const ConfigPage())
      ..child(notesPage, child: (context) => const NotesPage())
      ..child(homePage, child: (context) => const DeleteNotesPage())
      ..child(shortBreakPage, child: (context) => const TakeShortBreak())
      ..child(longBreakPage, child: (context) => const TakeLongBreak())
      ..child(settingsPage, child: (context) => const SettingsPage());
  }
}
