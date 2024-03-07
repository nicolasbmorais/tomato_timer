import 'package:flutter_modular/flutter_modular.dart';
import 'package:tomato_timer/modules/home/home_routing.dart';

class HomeModule extends Module {
  @override
  void binds(Injector i) {
    // TODO: implement binds
    super.binds(i);
  }

  @override
  void routes(RouteManager r) => HomeRouting.routes(r);
}
