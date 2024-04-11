// ignore_for_file: avoid_positional_boolean_parameters

import 'package:flutter/material.dart';
import 'package:tomato_timer/core/themes/ui/form/inputs/checkbox/checkbox.dart';

// ignore: must_be_immutable
abstract class BaseCheckBoxUI extends StatelessWidget {
  BaseCheckBoxUI({
    required this.text,
    this.validator,
    this.onChanged,
    this.onReset,
    this.enabled = true,
    this.secondary,
    this.initialValue = false,
    super.key,
  });

  late Widget checkboxButton = const SizedBox.shrink();
  final String text;
  final void Function(bool?)? onChanged;
  final void Function()? onReset;
  final bool enabled;
  final FormFieldValidator<bool>? validator;
  final Widget? secondary;
  final bool? initialValue;

  void get checkboxDefault {
    checkboxButton = CheckBoxButton(
      initialValue: initialValue,
      secondary: secondary,
      text: text,
      onChanged: onChanged,
      validator: validator,
      onReset: () => onReset,
      enabled: enabled,
    );
  }
}
