import 'package:flutter_modular/flutter_modular.dart';
import 'package:tomato_timer/app/app_routing.dart';
import 'package:tomato_timer/src/ui/controllers/home/home_cubit.dart';
import 'package:tomato_timer/src/ui/controllers/notes/notes_cubit.dart';
import 'package:tomato_timer/src/ui/controllers/timer/timer_cubit.dart';

class AppModule extends Module {
  @override
  void binds(Injector i) {
    i
      ..addSingleton<HomeCubit>(HomeCubit.new)
      ..addSingleton<TimerCubit>(TimerCubit.new)
      ..addSingleton<NotesCubit>(NotesCubit.new);
  }

  @override
  void routes(RouteManager r) => AppRouting.routes(r);
}
