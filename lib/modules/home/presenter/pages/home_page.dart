import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'package:tomato_timer/core/core.dart';
import 'package:tomato_timer/modules/home/home.dart';
import 'package:tomato_timer/modules/home/presenter/pages/widgets/notes_content_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return TemplateUI(
      appBar: const DefaultAppBarUI(),
      body: Column(
        children: [
          StepProgressIndicator(
            totalSteps: 4,
            size: 20,
            selectedColor: Colors.red,

            unselectedColor: AppColors.lightGrey100, //TODO remover depois
          ),
          TypographyUI('Pronto?', color: AppColors.greyDefault)..subheading,
          const SizedBox(height: 8),
          TypographyUI('00:00:00', color: AppColors.greyDefault)..h2Bold,
          const SizedBox(height: 24),
          ButtonUI('Comece a focar')..solid,
          const SizedBox(height: 40),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TypographyUI('Notas')..title,
              ButtonUI(
                'Adicionar notas',
                color: AppColors.orangePrimary,
                onPressed: () {
                  // Modular.to.pushNamed(HomeRouting.homePage);
                },
              )..textButton,
            ],
          ),
          const SizedBox(height: 24),
          const NotesContentWidget(),
        ],
      ),
    );
  }
}
