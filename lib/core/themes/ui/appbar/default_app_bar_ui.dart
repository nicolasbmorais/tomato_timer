import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tomato_timer/app/app_routing.dart';
import 'package:tomato_timer/core/core.dart';

class DefaultAppBarUI extends StatelessWidget {
  const DefaultAppBarUI({
    this.bottomPadding,
    this.leftPadding,
    this.rightPadding,
    this.topPadding,
    super.key,
  });

  final double? bottomPadding;
  final double? leftPadding;
  final double? rightPadding;
  final double? topPadding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 16,
        right: 16,
      ),
      child: Container(
        color: AppColors.backgroundColor,
        height: 50,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                SvgUI()..logo,
                const SizedBox(width: 10),
                TypographyUI('Tomato Timer')..body1Bold,
              ],
            ),
            Row(
              children: [
                SvgUI(
                  size: 20,
                  onTap: () {},
                )..restart,
                const SizedBox(width: 10),
                SvgUI(
                  size: 20,
                  onTap: () => Modular.to.pushNamed(AppRouting.settingsPage),
                )..settings,
              ],
            ),
          ],
        ),
      ),
    );
  }
}
