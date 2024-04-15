import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tomato_timer/app/app_routing.dart';
import 'package:tomato_timer/core/core.dart';

class TakeShortBreakPage extends StatelessWidget {
  const TakeShortBreakPage({super.key});

  @override
  Widget build(BuildContext context) {
    return TemplateUI(
      appBar: const DefaultAppBarUI(),
      body: Column(
        children: [
          TypographyUI('Restando', color: AppColors.blue)..subheading,
          const SizedBox(height: 8),
          TypographyUI('00:00:00', color: AppColors.blue)..h1Bold,
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 24),
            child: SvgUI(
              size: 300,
            )..personStopped,
          ),
          // const SizedBox(
          //   height: 50,
          // ),
          ButtonUI(
            'Continue focando',
            onPressed: () =>
                Modular.to.popUntil(ModalRoute.withName(AppRouting.homePage)),
            //O timer vai estar pausado e ao clicar nesse botao vai voltar
          )..outlined,
          const SizedBox(height: 12),
          Row(
            children: [
              _rowButton(text: 'Pequeno intervalo', onPressed: () {}),
              const SizedBox(width: 12),
              _rowButton(
                text: 'Longo intervalo',
                onPressed: () => Modular.to.pushNamedAndRemoveUntil(
                  AppRouting.longBreakPage,
                  ModalRoute.withName(AppRouting.homePage),
                ),
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
