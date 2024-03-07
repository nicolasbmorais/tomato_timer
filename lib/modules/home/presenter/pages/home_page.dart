import 'package:flutter/material.dart';
import 'package:tomato_timer/core/core.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return TemplateUI(
      appBar: const DefaultAppBarUI(),
      body: Column(
        children: [
          TypographyUI('text'),
        ],
      ),
    );
  }
}
