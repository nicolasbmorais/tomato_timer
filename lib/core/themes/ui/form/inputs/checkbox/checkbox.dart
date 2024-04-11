// ignore_for_file: avoid_positional_boolean_parameters

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:tomato_timer/core/core.dart';

class CheckBoxButton extends StatelessWidget {
  const CheckBoxButton({
    required this.text,
    required this.onChanged,
    required this.validator,
    this.enabled = true,
    this.onReset,
    this.secondary,
    this.initialValue = false,
    super.key,
  });

  final String text;
  final bool enabled;
  final void Function(bool?)? onChanged;
  final void Function()? onReset;
  final FormFieldValidator<bool>? validator;
  final Widget? secondary;
  final bool? initialValue;

  @override
  Widget build(BuildContext context) {
    return ListTileTheme(
      horizontalTitleGap: 0,
      child: Theme(
        data: ThemeData(
          checkboxTheme: CheckboxThemeData(
            fillColor: MaterialStateProperty.resolveWith<Color>(
              (Set<MaterialState> states) {
                if (states.contains(MaterialState.disabled)) {
                  return AppColors.white;
                }
                return AppColors.white;
              },
            ),
          ),
        ),
        child: FormBuilderCheckbox(
          initialValue: initialValue,
          secondary: secondary,
          name: 'checkbox',
          title: TypographyUI(
            text,
            color: AppColors.black,
          )..body1,
          checkColor: AppColors.green,
          onChanged: onChanged,
          onReset: () => onReset,
          side: MaterialStateBorderSide.resolveWith(
            (Set<MaterialState> states) {
              return BorderSide(color: AppColors.black);
            },
          ),
          enabled: enabled,
          validator: validator,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.zero,
            border: InputBorder.none,
            errorStyle: TextStyle(
              fontSize: 14,
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w300,
              height: 0.12,
              letterSpacing: 0.10,
              color: AppColors.dangerSystem,
            ),
          ),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(2),
            ),
          ),
        ),
      ),
    );
  }
}
