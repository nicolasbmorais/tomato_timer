import 'package:flutter/material.dart';
import 'package:tomato_timer/core/core.dart';

class TemplateUI extends StatelessWidget {
  const TemplateUI({
    required this.body,
    super.key,
    this.appBar,
    this.backgroundColor,
    this.topPadding,
    this.leftPadding,
    this.rightPadding,
    this.bottomPading,
    // this.alertModelUI,
    this.alignmentGeometry,
    this.statusBarColor,
    this.fixedBottomWidget,
  });

  final Widget body;
  final Widget? appBar;
  final Color? backgroundColor;
  final double? topPadding;
  final double? leftPadding;
  final double? rightPadding;
  final double? bottomPading;
  // final AlertModelUI? alertModelUI;
  final AlignmentGeometry? alignmentGeometry;
  final Color? statusBarColor;
  final Widget? fixedBottomWidget;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor ?? AppColors.backgroundColor,
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: [
            Align(
              alignment: alignmentGeometry ?? Alignment.topCenter,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    if (appBar != null) ...[
                      appBar!,
                    ],
                    Padding(
                      padding: EdgeInsets.only(
                        left: leftPadding ?? 24,
                        right: rightPadding ?? 24,
                        top: topPadding ?? 24,
                        bottom: bottomPading ?? 0,
                      ),
                      child: body,
                    ),
                  ],
                ),
              ),
            ),

            // AlertUI( //TODO;rever alert
            //   alertModelUI: alertModelUI,
            // ),
          ],
        ),
      ),
      bottomNavigationBar: fixedBottomWidget,
    );
  }
}
