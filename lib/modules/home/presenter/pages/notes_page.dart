import 'package:flutter/material.dart';
import 'package:tomato_timer/core/core.dart';

class NotesPage extends StatelessWidget {
  const NotesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return TemplateUI(
      body: Column(
        children: [
          TypographyUI('Notas')..h2Bold,
        ],
      ),
    );
  }
}
