import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tomato_timer/app/app_routing.dart';
import 'package:tomato_timer/core/core.dart';
import 'package:tomato_timer/src/controllers/timer/timer_cubit.dart';

class DefaultAppBarUI extends StatelessWidget {
  const DefaultAppBarUI({
    this.hideLeadingIcons = false,
    super.key,
  });

  final bool hideLeadingIcons;

  @override
  Widget build(BuildContext context) {
    final cubit = Modular.get<TimerCubit>();

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
            if (hideLeadingIcons)
              const SizedBox.shrink()
            else
              Row(
                children: [
                  SvgUI(
                    size: 20,
                    onTap: cubit.restart,
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
