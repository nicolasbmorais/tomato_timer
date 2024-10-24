import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:tomato_timer/app/app_routing.dart';
import 'package:tomato_timer/core/core.dart';
import 'package:tomato_timer/src/controllers/settings/settings_cubit.dart';
import 'package:tomato_timer/src/controllers/timer/timer_cubit.dart';

class TakeShortBreakPage extends StatefulWidget {
  const TakeShortBreakPage({super.key});

  @override
  State<TakeShortBreakPage> createState() => _TakeShortBreakPageState();
}

class _TakeShortBreakPageState extends State<TakeShortBreakPage> {
  final cubit = Modular.get<TimerCubit>();
  final settingsCubit = Modular.get<SettingsCubit>();
  StopWatchTimer stopWatchTimer = StopWatchTimer(mode: StopWatchMode.countDown);

  @override
  void initState() {
    super.initState();
    stopWatchTimer = StopWatchTimer(
      mode: StopWatchMode.countDown,
      presetMillisecond: StopWatchTimer.getMilliSecFromMinute(
        settingsCubit.settingsModel.shortBreak,
      ),
    );

    stopWatchTimer.onStartTimer();
  }

  @override
  void dispose() {
    super.dispose();
    stopWatchTimer.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TemplateUI(
      appBar: const DefaultAppBarUI(
        hideLeadingIcons: true,
      ),
      body: Column(
        children: [
          TypographyUI('Restando', color: AppColors.blue)..subheading,
          const SizedBox(height: 8),
          StreamBuilder<int>(
            stream: stopWatchTimer.rawTime,
            initialData: stopWatchTimer.rawTime.value,
            builder: (context, state) {
              final displayTime = StopWatchTimer.getDisplayTime(
                state.data!,
                milliSecond: false,
              );
              return TypographyUI(displayTime, color: AppColors.blue)..h1Bold;
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 50),
            child: SvgUI(
              size: 300,
            )..personStopped,
          ),
          ButtonUI(
            'Continue focando',
            onPressed: () {
              cubit.startTimer(context);
              Modular.to.popUntil(ModalRoute.withName(AppRouting.timerPage));
            },
          )..outlined,
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}
