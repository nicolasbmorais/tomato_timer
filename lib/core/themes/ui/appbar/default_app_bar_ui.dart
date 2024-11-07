import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tomato_timer/app/app_routing.dart';
import 'package:tomato_timer/core/core.dart';
import 'package:tomato_timer/src/service/countdown_timer/bloc/countdown_cubit.dart';

class DefaultAppBarUI extends StatelessWidget implements PreferredSizeWidget {
  const DefaultAppBarUI({super.key, this.showRestartIcon = false});

  final bool showRestartIcon;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    final cubit = Modular.get<CountDownCubit>();

    return AppBar(
      backgroundColor: AppColors.backgroundColor,
      automaticallyImplyLeading: false,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 8),
                child: SvgUI(
                  isIcon: true,
                  onTap: () {
                    cubit.resetTimer();
                    Modular.to.popUntil(
                      ModalRoute.withName(AppRouting.timerPage),
                    );
                  },
                )..logo,
              ),
              TypographyUI('Tomato Timer')..body2Bold,
            ],
          ),
          Row(
            children: [
              if (showRestartIcon) ...[
                SvgUI(
                  isIcon: true,
                  onTap: cubit.resetTimer,
                )..restart,
                const SizedBox(width: 10),
              ],
              SvgUI(
                isIcon: true,
                onTap: () => Modular.to.pushNamed(AppRouting.settingsPage),
              )..settings,
            ],
          ),
        ],
      ),
    );
  }
}
