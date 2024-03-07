import 'package:flutter/material.dart';
import 'package:tomato_timer/core/themes/ui/button/base_button_ui.dart';

/// Textos padrões do projeot
//ignore: must_be_immutable
class ButtonUI extends BaseButtonUI {
  /// Construtor padrão
  ButtonUI(
    super.text, {
    super.key,
    super.onPressed,
    super.suffixIcon,
    super.info,
    super.color,
    super.background,
    super.prefixIcon,
    this.isExpanded = false,
    this.height,
    this.width,
    super.body,
  });

  final bool isExpanded;

  // ignore: annotate_overrides, overridden_fields
  final double? width;

  // ignore: annotate_overrides, overridden_fields
  final double? height;

  void makeIsExpanded() {
    if (!isExpanded) {
      return;
    }
    button = Expanded(
      child: button,
    );
  }

  void setWidth() {
    if (width == null && height == null) {
      return;
    }

    button = SizedBox(
      width: width,
      height: height,
      child: button,
    );
  }

  Widget makeFullWidget() {
    makeIsExpanded();
    setWidth();

    return button;
  }

  @override
  Widget build(BuildContext context) {
    return makeFullWidget();
  }
}
