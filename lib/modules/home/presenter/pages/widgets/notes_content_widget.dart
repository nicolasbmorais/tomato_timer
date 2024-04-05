import 'package:flutter/material.dart';
import 'package:tomato_timer/core/core.dart';

class NotesContentWidget extends StatelessWidget {
  const NotesContentWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SvgUI()..arrowBack,
            TypographyUI('Pomodoro 1 de 4')..body1Bold,
            SvgUI()..arrowForward,
          ],
        ),
        const SizedBox(height: 16),
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: AppColors.lightGrey100,
            borderRadius: const BorderRadius.all(Radius.circular(5)),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Center(
              child: TypographyUI('Você ainda não tem nenhuma nota')..body1,
            ),
          ),
        ),
      ],
    );
  }
}
