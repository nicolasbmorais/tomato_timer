import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tomato_timer/app/app_routing.dart';
import 'package:tomato_timer/core/core.dart';

class InitialPage extends StatelessWidget {
  const InitialPage({super.key});

  @override
  Widget build(BuildContext context) {
    return TemplateUI(
      body: Column(
        children: [
          TypographyUI('Comece a focar')..h2Bold,
          const SizedBox(height: 24),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 30),
            child: SvgUI(size: 0.55)..personIntroduction,
          ),
        ],
      ),
      bottomNavigationBar: ButtonUI(
        'Iniciar ciclo pomodoro',
        onPressed: () => Modular.to.pushNamed(AppRouting.timerPage),
      )..solid,
    );
  }
}
