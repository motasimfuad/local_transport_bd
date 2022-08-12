import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/colors.dart';
import 'k_card.dart';

class KIconButton extends StatelessWidget {
  final IconData? icon;
  final Color? iconColor;
  final Color? bgColor;
  final Function()? onPressed;
  final double? radius;
  final Widget? child;
  const KIconButton({
    Key? key,
    this.icon,
    this.iconColor,
    this.bgColor,
    this.onPressed,
    this.radius,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return KCard(
      yPadding: 8.w,
      xPadding: 8.w,
      hasShadow: false,
      onTap: onPressed,
      color: bgColor ?? KColors.primary.shade400,
      radius: radius ?? 10.r,
      child: child != null
          ? SizedBox(
              height: 20.w,
              width: 20.w,
              child: child,
            )
          : Icon(
              icon ?? Icons.send_rounded,
              color: iconColor ?? KColors.primary.shade700,
              size: 20.w,
            ),
    );
  }
}
