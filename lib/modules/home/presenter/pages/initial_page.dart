import 'package:flutter/material.dart';
import 'package:tomato_timer/core/core.dart';

class InitialPage extends StatelessWidget {
  const InitialPage({super.key});
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
          ButtonUI('Iniciar o ciclo pomodoro')..solid,
        ],
      ),
    );
  }
}
