import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tomato_timer/core/core.dart';
import 'package:tomato_timer/core/themes/ui/form/form_ui.dart';
import 'package:tomato_timer/core/themes/ui/form/inputs/checkbox/checkbox_ui.dart';
import 'package:tomato_timer/core/themes/ui/form/inputs/dropdown/dropdown_ui.dart';
import 'package:tomato_timer/src/controllers/settings/settings_cubit.dart';
import 'package:tomato_timer/src/controllers/timer/timer_cubit.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final cubit = Modular.get<SettingsCubit>();
  final formKey = FormUI.generateKey;

  @override
  void initState() {
    super.initState();
    cubit.getPreferences();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsCubit, SettingsState>(
      bloc: cubit,
      builder: (context, state) {
        return TemplateUI(
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: AppColors.backgroundColor,
            title: TypographyUI('Configurações')..h3Bold,
          ),
          body: FormUI(
            formKey: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFieldUI(
                  name: 'focusDuration',
                  hintText: '',
                  label: 'Duração do Pomodoro em minutos',
                  initialValue: cubit.settingsModel.focusDuration.toString(),
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    cubit.focusDuration = value!;
                  },
                ),
                const SizedBox(height: 24),
                TextFieldUI(
                  name: 'shortBreak',
                  hintText: '',
                  label: 'Duração do intervalo curto em minutos',
                  initialValue: cubit.settingsModel.shortBreak.toString(),
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    cubit.shortBreak = value!;
                  },
                ),
                const SizedBox(height: 24),
                TextFieldUI(
                  name: 'longBreak',
                  hintText: '',
                  label: 'Duração do intervalo longo em minutos',
                  initialValue: cubit.settingsModel.longBreak.toString(),
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    cubit.longBreak = value!;
                  },
                ),
                const SizedBox(height: 24),
                DropdownUI(
                  name: 'timer',
                  label: 'Som do temporizador',
                  hintText: 'Nenhum',
                  width: double.infinity,
                  itens: [
                    DropdownUI.item(
                      value: 'none',
                      text: 'Nenhum',
                    ),
                    DropdownUI.item(
                      value: 'soundA',
                      text: 'Som A',
                    ),
                    DropdownUI.item(
                      value: 'soundB',
                      text: 'Som B',
                    ),
                  ],
                ),
                const SizedBox(height: 32),
                CheckBoxUI(
                  text: 'Mostrar notificação quando concluído',
                  initialValue: cubit.showCompleteNotification,
                  onChanged: (val) {
                    cubit.showCompleteNotification = val ?? true;
                  },
                )..checkboxDefault,
                CheckBoxUI(
                  text: 'Reiniciar automaticamente',
                  initialValue: cubit.restartAutomatically,
                  onChanged: (val) {
                    cubit.restartAutomatically = val ?? true;
                  },
                )..checkboxDefault,
              ],
            ),
          ),
          fixedBottomWidget: Padding(
            padding: const EdgeInsets.all(24),
            child: ButtonUI(
              '',
              body: state is SettingsLoading
                  ? SizedBox(
                      height: 20,
                      width: 20,
                      child: CircularProgressIndicator(
                        color: AppColors.black,
                        strokeWidth: 3,
                      ),
                    )
                  : TypographyUI('Salvar'),
              onPressed: () async {
                await cubit.applyPreferences().then(
                      (_) => Modular.get<TimerCubit>().setTimerValue(
                        cubit.settingsModel.focusDuration!,
                      ),
                    );
              },
            )..solid,
          ),
        );
      },
    );
  }
}
