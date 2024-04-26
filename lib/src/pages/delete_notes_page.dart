import 'package:flutter/material.dart';
import 'package:tomato_timer/core/core.dart';

class DeleteNotesPage extends StatelessWidget {
  const DeleteNotesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return TemplateUI(
      appBar: const DefaultAppBarUI(),
      body: Column(
        children: [
          TypographyUI('Excluir notas?')..h2Bold,
          TypographyUI('Isso é permanente e não pode ser desfeito')..body1,
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 32),
            child: SvgUI(
              size: 300,
            )..personAttention,
          ),
          Row(
            children: [
              ButtonUI(
                'Excluir',
                isExpanded: true,
              )..outlinedCustom(buttonColor: AppColors.black),
              const SizedBox(width: 8),
              ButtonUI(
                'Apagar',
                isExpanded: true,
              )..solid,
            ],
          ),
        ],
      ),
    );
  }
}
