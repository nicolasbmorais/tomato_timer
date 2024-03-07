import 'package:flutter_modular/flutter_modular.dart';
import 'package:tomato_timer/modules/home/home.dart';

class HomeRouting {
  static String get initial => '/';

  /// Rotas do módulo
  static void routes(RouteManager r) {
    r.child('/', child: (context) => const HomePage());
  }
}
