import 'package:flutter/material.dart';
import 'package:tomato_timer/core/core.dart';
import 'package:tomato_timer/core/themes/ui/button/types/outlined_button_ui.dart';
import 'package:tomato_timer/core/themes/ui/button/types/solid_button_ui.dart';
import 'package:tomato_timer/core/themes/ui/button/types/text_button_ui.dart';

//ignore: must_be_immutable
abstract class BaseButtonUI extends StatelessWidget {
  BaseButtonUI(
    this.text, {
    this.onPressed,
    this.suffixIcon,
    this.info,
    this.color,
    this.background,
    this.height,
    this.prefixIcon,
    this.width,
    this.body,
    super.key,
  });

  late Widget button;
  final String text;
  final void Function()? onPressed;
  final Widget? suffixIcon;
  final Color? color;
  final Color? background;
  final String? info;
  final double? height;
  final double? width;
  final Widget? prefixIcon;
  final Widget? body;

  void get outlined {
    button = OutlinedButtonUI(
      body: body ??
          Container(
            child: TypographyUI(
              text,
              color: AppColors.backgroundColor,
              textAlign: TextAlign.center,
            )..h1,
          ),
      height: 52,
      width: width,
      borderSideColor: AppColors.backgroundColor,
      onPressed: onPressed,
      prefixIcon: prefixIcon,
      suffixIcon: suffixIcon,
    );
  }

  void get solid {
    button = SolidButtonUI(
      body: body ??
          Container(
            child: TypographyUI(
              text,
              color: AppColors.black,
              textAlign: TextAlign.center,
            )..h1,
          ),
      height: 52,
      width: width,
      backgroundColor: AppColors.orangePrimary,
      onPressed: onPressed,
      prefixIcon: prefixIcon,
      suffixIcon: suffixIcon,
    );
  }

  void get textButton {
    button = TextButtonUI(
      text: text,
      height: 52,
      textColor: color ?? AppColors.black,
      onPressed: onPressed,
    );
  }

  void solidCustom({
    required Color backgroundColor,
    Color? textColor,
    BorderSide? borderSide,
  }) {
    button = SolidButtonUI(
      body: body ??
          Container(
            child: TypographyUI(
              text,
              color: textColor ?? AppColors.black,
              textAlign: TextAlign.center,
            )..h1,
          ),
      prefixIcon: prefixIcon,
      height: 56,
      backgroundColor: backgroundColor,
      onPressed: onPressed,
      borderSide: borderSide,
    );
  }
}
