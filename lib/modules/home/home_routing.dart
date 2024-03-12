import 'package:flutter_modular/flutter_modular.dart';
import 'package:tomato_timer/modules/home/home.dart';
import 'package:tomato_timer/modules/home/presenter/pages/initial_page.dart';

class HomeRouting {
  static String get initial => '/';
  static String get homePage => '/home';

  /// Rotas do módulo
  static void routes(RouteManager r) {
    r
      ..child(initial, child: (context) => const InitialPage())
      ..child(homePage, child: (context) => const HomePage());
  }
}
