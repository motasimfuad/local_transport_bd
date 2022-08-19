import 'package:flutter/material.dart';

import 'package:local_transport_bd/core/constants/constants.dart';

class IconWithLocationItem extends StatelessWidget {
  final IconData icon;
  final String location;
  final MainAxisAlignment? mainAxisAlignment;
  final Color? iconColor;
  final Color? textColor;
  final double? textSize;
  final double? iconSize;
  const IconWithLocationItem({
    Key? key,
    required this.icon,
    required this.location,
    this.mainAxisAlignment,
    this.iconColor,
    this.textColor,
    this.textSize,
    this.iconSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          color: iconColor ?? KColors.primary.shade400,
          size: iconSize ?? 16.w,
        ),
        SizedBox(width: 6.w),
        Text(
          location,
          style: TextStyle(
            fontSize: textSize ?? 14.sp,
            fontWeight: FontWeight.w500,
            color: textColor ?? KColors.primary.shade400,
          ),
        ),
      ],
    );
  }
}
