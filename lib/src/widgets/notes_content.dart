import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tomato_timer/app/app_routing.dart';
import 'package:tomato_timer/core/core.dart';
import 'package:tomato_timer/src/widgets/notes_widget.dart';

class NotesContent extends StatelessWidget {
  const NotesContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TypographyUI('Notas')..title,
            ButtonUI(
              'Adicionar notas',
              color: AppColors.orangePrimary,
              onPressed: () {
                Modular.to.pushNamed(AppRouting.notesPage);
              },
            )..textButton,
          ],
        ),
        // const SizedBox(height: 20),
        const NotesContentWidget(),
      ],
    );
  }
}
