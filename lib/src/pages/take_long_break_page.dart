import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:tomato_timer/app/app_routing.dart';
import 'package:tomato_timer/core/core.dart';
import 'package:tomato_timer/src/controllers/settings/settings_cubit.dart';
import 'package:tomato_timer/src/controllers/timer/timer_cubit.dart';

class TakeLongBreakPage extends StatefulWidget {
  const TakeLongBreakPage({super.key});

  @override
  State<TakeLongBreakPage> createState() => _TakeLongBreakPageState();
}

class _TakeLongBreakPageState extends State<TakeLongBreakPage> {
  final settingsCubit = Modular.get<SettingsCubit>();
  StopWatchTimer stopWatchTimer = StopWatchTimer(mode: StopWatchMode.countDown);
  late bool isRestartAutomatically;

  @override
  void initState() {
    super.initState();
    stopWatchTimer = StopWatchTimer(
      mode: StopWatchMode.countDown,
      presetMillisecond: StopWatchTimer.getMilliSecFromMinute(
        settingsCubit.settingsModel.longBreak ?? 5,
      ),
    );

    stopWatchTimer.onStartTimer();

    isRestartAutomatically =
        settingsCubit.settingsModel.restartAutomatically ?? false;
  }

  @override
  void dispose() {
    super.dispose();
    stopWatchTimer.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cubit = Modular.get<TimerCubit>();

    return TemplateUI(
      bottomPading: 32,
      appBar: const DefaultAppBarUI(),
      body: Column(
        children: [
          TypographyUI('Faça uma pausa longa')..h2Bold,
          const SizedBox(height: 16),
          TypographyUI('Parabéns pelo excelente trabalho!')..body1,
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 32),
            child: SvgUI(
              size: 300,
            )..personLongBreak,
          ),
          const SizedBox(height: 30),
          if (isRestartAutomatically)
            FittedBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TypographyUI('Reiniciando o ciclo pomodoro em ')..body1,
                  StreamBuilder<int>(
                    stream: stopWatchTimer.rawTime,
                    initialData: stopWatchTimer.rawTime.value,
                    builder: (context, state) {
                      final displayTime = int.tryParse(
                        StopWatchTimer.getDisplayTime(
                          state.data!,
                          hours: false,
                          second: false,
                          milliSecond: false,
                        ),
                      );
                      return TypographyUI('$displayTime minutos...')..body1;
                    },
                  ),
                ],
              ),
            )
          else
            GestureDetector(
              onTap: () {
                cubit.restartTimer();
                Modular.to.popUntil(ModalRoute.withName(AppRouting.timerPage));
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgUI()..restart,
                  const SizedBox(width: 8),
                  TypographyUI('Reiniciar o ciclo pomodoro')..body1,
                ],
              ),
            ),
        ],
      ),
    );
  }
}
