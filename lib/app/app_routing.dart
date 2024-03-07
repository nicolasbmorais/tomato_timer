import 'package:flutter_modular/flutter_modular.dart';
import 'package:tomato_timer/modules/home/home_module.dart';
import 'package:tomato_timer/modules/home/home_routing.dart';

class AppRouting {
  /// Construtor privado para impedir instanciação
  AppRouting();

  /// Lista de rotas do módulo
  static void routes(RouteManager r) {
    r.module(
      HomeRouting.initial,
      module: HomeModule(),
    );
  }
}
