import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tomato_timer/app/app_routing.dart';
import 'package:tomato_timer/core/core.dart';

class TakeShortInfoBreakPage extends StatelessWidget {
  const TakeShortInfoBreakPage({super.key});

  @override
  Widget build(BuildContext context) {
    return TemplateUI(
      appBar: const DefaultAppBarUI(),
      body: Column(
        children: [
          TypographyUI('Faça uma pequena pausa')..h2Bold,
          const SizedBox(height: 16),
          TypographyUI('Faltam mais 3 pomodoros. Legal!')..body1,
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 32),
            child: SvgUI(
              size: 300,
            )..personShortBreak,
          ),
          ButtonUI(
            'Comece um pequeno intervalo',
            onPressed: () => Modular.to.pushNamed(AppRouting.shortBreakPage),
          )..solidCustom(backgroundColor: AppColors.blue),
          const SizedBox(height: 12),
          Row(
            children: [
              _rowButton(text: 'Voltar', onPressed: () => Modular.to.pop()),
              const SizedBox(width: 12),
              _rowButton(
                text: 'Intervalo longo',
                onPressed: () => Modular.to.pushNamed(AppRouting.longBreakPage),
              ),
            ],
          ),
        ],
      ),
    );
  }

  ButtonUI _rowButton({
    required String text,
    required void Function()? onPressed,
  }) {
    return ButtonUI(
      text,
      isExpanded: true,
      onPressed: onPressed,
    )..outlinedCustom(buttonColor: AppColors.black);
  }
}
