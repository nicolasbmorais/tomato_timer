import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tomato_timer/core/core.dart';
import 'package:tomato_timer/core/themes/ui/form/inputs/checkbox/checkbox_ui.dart';
import 'package:tomato_timer/core/themes/ui/form/inputs/dropdown/dropdown_ui.dart';
import 'package:tomato_timer/src/controllers/settings/settings_cubit.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return TemplateUI(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColors.white,
        title: TypographyUI('Configurações')..h3Bold,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TypographyUI('Duração do Pomodoro')..body1,
          const TextFieldUI(
            name: 'duration',
            hintText: 'Duração em minutos',
          ),
          const SizedBox(height: 24),
          TypographyUI('Duração do intervalo curto')..body1,
          const TextFieldUI(
            name: 'duration',
            hintText: 'Duração em minutos',
          ),
          const SizedBox(height: 24),
          TypographyUI('Duração do intervalo longo')..body1,
          const TextFieldUI(
            name: 'duration',
            hintText: 'Duração em minutos',
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
          )..checkboxDefault,
          ButtonUI(
            'Salvar',
            onPressed: () {
              Modular.get<SettingsCubit>().applyPreferences();
            },
          )..solid,
        ],
      ),
      fixedBottomWidget: Padding(
        padding: const EdgeInsets.all(24),
        child: ButtonUI(
          'Pegar',
          onPressed: () {
            Modular.get<SettingsCubit>().getPreferences();
          },
        )..solid,
      ),
    );
  }
}
