import 'package:flutter_modular/flutter_modular.dart';
import 'package:tomato_timer/src/ui/pages/delete_notes_page.dart';
import 'package:tomato_timer/src/ui/pages/home_page.dart';
import 'package:tomato_timer/src/ui/pages/initial_page.dart';
import 'package:tomato_timer/src/ui/pages/notes_page.dart';
import 'package:tomato_timer/src/ui/pages/settings_page.dart';
import 'package:tomato_timer/src/ui/pages/take_long_break.dart';
import 'package:tomato_timer/src/ui/pages/take_short_break.dart';

class AppRouting {
  static String get initial => '/';
  static String get homePage => '/home';
  static String get notesPage => '/notes';
  static String get deleteNotesPage => '/deleteNotes';
  static String get shortBreakPage => '/shortBreakPage';
  static String get longBreakPage => '/longBreakPage';
  static String get settingsPage => '/settingsPage';

  /// Lista de rotas do módulo
  static void routes(RouteManager r) {
    r
      ..child(initial, child: (context) => const InitialPage())
      ..child(homePage, child: (context) => const HomePage())
      ..child(notesPage, child: (context) => const NotesPage())
      ..child(homePage, child: (context) => const DeleteNotesPage())
      ..child(shortBreakPage, child: (context) => const TakeShortBreak())
      ..child(longBreakPage, child: (context) => const TakeLongBreak())
      ..child(settingsPage, child: (context) => const SettingsPage());
  }
}
