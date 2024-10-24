import 'package:flutter/material.dart';
import 'package:tomato_timer/core/themes/ui/form/inputs/checkbox/base_checkbox_ui.dart';

// ignore: must_be_immutable
class CheckBoxUI extends BaseCheckBoxUI {
  CheckBoxUI({
    required super.name,
    required super.text,
    super.validator,
    super.onChanged,
    super.enabled,
    super.onReset,
    super.secondary,
    super.initialValue,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return checkboxButton;
  }
}
