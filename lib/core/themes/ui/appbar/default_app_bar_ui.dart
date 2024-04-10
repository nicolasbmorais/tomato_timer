import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tomato_timer/core/core.dart';

class DefaultAppBarUI extends StatelessWidget {
  const DefaultAppBarUI({
    this.bottomPadding,
    this.leftPadding,
    this.rightPadding,
    this.topPadding,
    this.settingsOnTap,
    this.restartOnTap,
    super.key,
  });

  final double? bottomPadding;
  final double? leftPadding;
  final double? rightPadding;
  final double? topPadding;
  final void Function()? settingsOnTap;
  final void Function()? restartOnTap;

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
                GestureDetector(
                  onTap: restartOnTap,
                  child: SvgUI(size: 20)..restart,
                ),
                const SizedBox(width: 10),
                GestureDetector(
                  onTap: settingsOnTap,
                  child: SvgUI(size: 20)..settings,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
