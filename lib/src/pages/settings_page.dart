import 'package:flutter/material.dart';
import 'package:tomato_timer/core/core.dart';
import 'package:tomato_timer/core/themes/ui/form/inputs/checkbox/checkbox_ui.dart';
import 'package:tomato_timer/core/themes/ui/form/inputs/dropdown/dropdown_ui.dart';

enum TypeButtons { focus, shortBreak, longBreak }

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  TypeButtons _typeButtons = TypeButtons.focus;
  @override
  Widget build(BuildContext context) {
    return TemplateUI(
      appBar: AppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(child: TypographyUI('Configurações')..h2Bold),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buttons(
                name: 'Foco',
                isSelected: _typeButtons == TypeButtons.focus,
                onTap: () {
                  setState(() {
                    _typeButtons = TypeButtons.focus;
                  });
                },
              ),
              _buttons(
                name: 'Intervalo curto',
                isSelected: _typeButtons == TypeButtons.shortBreak,
                onTap: () {
                  setState(() {
                    _typeButtons = TypeButtons.shortBreak;
                  });
                },
              ),
              _buttons(
                name: 'Intervalo longo',
                isSelected: _typeButtons == TypeButtons.longBreak,
                onTap: () {
                  setState(() {
                    _typeButtons = TypeButtons.longBreak;
                  });
                },
              ),
            ],
          ),
          const SizedBox(height: 24),
          const TextFieldUI(
            name: 'duration',
            label: 'Duração em minutos',
            hintText: '0',
            width: 150,
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
        ],
      ),
      fixedBottomWidget: Padding(
        padding: const EdgeInsets.all(24),
        child: ButtonUI(
          'Salvar',
          onPressed: () {},
        )..solid,
      ),
    );
  }

  Widget _buttons({
    required String name,
    required bool isSelected,
    void Function()? onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 100,
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              width: 2,
              color: isSelected
                  ? AppColors.orangePrimary
                  : AppColors.enabledBorderButton,
            ),
          ),
        ),
        child: Center(child: TypographyUI(name)..body2Bold),
      ),
    );
  }
}
