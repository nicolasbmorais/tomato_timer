import 'package:flutter_modular/flutter_modular.dart';
import 'package:tomato_timer/modules/home/controller/home_cubit.dart';
import 'package:tomato_timer/modules/home/home_routing.dart';

class HomeModule extends Module {
  @override
  void binds(Injector i) {
    i.addSingleton<HomeCubit>(HomeCubit.new);
    super.binds(i);
  }

  @override
  void routes(RouteManager r) => HomeRouting.routes(r);
}
