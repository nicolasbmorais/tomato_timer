import 'package:flutter_modular/flutter_modular.dart';
import 'package:tomato_timer/app/app_routing.dart';
import 'package:tomato_timer/src/controllers/home/home_cubit.dart';
import 'package:tomato_timer/src/controllers/notes/notes_cubit.dart';
import 'package:tomato_timer/src/controllers/settings/settings_cubit.dart';
import 'package:tomato_timer/src/service/countdown_timer/bloc/countdown_cubit.dart';
import 'package:tomato_timer/src/service/countdown_timer/ticker.dart';

class AppModule extends Module {
  @override
  void binds(Injector i) {
    i
      ..addSingleton<Ticker>(Ticker.new)
      ..addSingleton<NotesCubit>(NotesCubit.new)
      ..addSingleton<SettingsCubit>(SettingsCubit.new)
      ..addSingleton<CountDownCubit>(CountDownCubit.new)
      ..addSingleton<HomeCubit>(HomeCubit.new);
  }

  @override
  void routes(RouteManager r) => AppRouting.routes(r);
}
