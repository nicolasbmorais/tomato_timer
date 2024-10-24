import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tomato_timer/app/app_routing.dart';
import 'package:tomato_timer/core/core.dart';
import 'package:tomato_timer/src/controllers/settings/settings_cubit.dart';
import 'package:tomato_timer/src/controllers/timer/timer_cubit.dart';

class InitialPage extends StatefulWidget {
  const InitialPage({super.key});

  @override
  State<InitialPage> createState() => _InitialPageState();
}

class _InitialPageState extends State<InitialPage> {
  @override
  void initState() {
    super.initState();

    final timerCubit = Modular.get<TimerCubit>();
    final settingsCubit = Modular.get<SettingsCubit>();

    timerCubit.setTimerValue(settingsCubit.settingsModel.focusDuration);
  }

  @override
  Widget build(BuildContext context) {
    return TemplateUI(
      appBar: const DefaultAppBarUI(),
      body: Column(
        children: [
          TypographyUI('Iniciar foco')..h2Bold,
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 30),
            child: SvgUI(size: 300)..personIntroduction,
          ),
          const SizedBox(height: 24),
          ButtonUI(
            'Iniciar o ciclo pomodoro',
            onPressed: () => Modular.to.pushNamed(AppRouting.timerPage),
          )..solid,
        ],
      ),
    );
  }
}
