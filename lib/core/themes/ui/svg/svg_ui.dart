import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tomato_timer/core/themes/ui/svg/base_svg_ui.dart';

/// SvgUI é a abstração dos svg
//ignore: must_be_immutable
class SvgUI extends BaseSvgUI {
  /// Construtor padrão
  SvgUI({
    super.key,
    this.size,
    this.color,
  });

  /// width define a largura
  final double? size;

  final Color? color;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      path,
      width: size ?? 24,
      height: size ?? 24,
      colorFilter: color != null
          ? ColorFilter.mode(
              color!,
              BlendMode.srcIn,
            )
          : null,
    );
  }
}
