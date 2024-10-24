import 'package:flutter_modular/flutter_modular.dart';
import 'package:tomato_timer/app/app_routing.dart';
import 'package:tomato_timer/src/controllers/notes/notes_cubit.dart';
import 'package:tomato_timer/src/controllers/timer/timer_cubit.dart';

class AppModule extends Module {
  @override
  void binds(Injector i) {
    i
      ..addSingleton<NotesCubit>(NotesCubit.new)
      ..addSingleton<TimerCubit>(TimerCubit.new);
  }

  @override
  void routes(RouteManager r) => AppRouting.routes(r);
}
