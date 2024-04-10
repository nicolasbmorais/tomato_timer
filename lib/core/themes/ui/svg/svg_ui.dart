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
    this.onTap,
  });

  /// width define a largura
  final double? size;

  final Color? color;

  void Function()? onTap;
  

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SvgPicture.asset(
        path,
        width: size ?? 16,
        height: size ?? 16,
        colorFilter: color != null
            ? ColorFilter.mode(
                color!,
                BlendMode.srcIn,
              )
            : null,
      ),
    );
  }
}
