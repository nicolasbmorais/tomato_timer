import 'package:flutter_modular/flutter_modular.dart';
import 'package:tomato_timer/src/pages/delete_notes_page.dart';
import 'package:tomato_timer/src/pages/initial_page.dart';
import 'package:tomato_timer/src/pages/notes_page.dart';
import 'package:tomato_timer/src/pages/settings_page.dart';
import 'package:tomato_timer/src/pages/take_long_break_page.dart';
import 'package:tomato_timer/src/pages/take_short_break_info_page.dart';
import 'package:tomato_timer/src/pages/take_short_break_page.dart';
import 'package:tomato_timer/src/pages/timer_page.dart';

class AppRouting {
  static String get timerPage => '/timer_page';
  static String get notesPage => '/notes_page';
  static String get deleteNotesPage => '/delete_notes_page';
  static String get shortBreakInfoPage => '/short_break_info_page';
  static String get shortBreakPage => '/short_break_page';
  static String get longBreakPage => '/long_break_page';
  static String get settingsPage => '/settings_page';

  /// Lista de rotas do módulo
  static void routes(RouteManager r) {
    r
      ..child(
        '/',
        child: (context) => const InitialPage(),
      )
      ..child(
        timerPage,
        child: (context) => const TimerPage(),
      )
      ..child(
        notesPage,
        child: (context) => const NotesPage(),
      )
      ..child(
        deleteNotesPage,
        child: (context) => const DeleteNotesPage(),
      )
      ..child(
        shortBreakInfoPage,
        child: (context) => const TakeShortInfoBreakPage(),
      )
      ..child(
        shortBreakPage,
        child: (context) => const TakeShortBreakPage(),
      )
      ..child(
        longBreakPage,
        child: (context) => const TakeLongBreakPage(),
      )
      ..child(
        settingsPage,
        child: (context) => const SettingsPage(),
      );
  }
}
