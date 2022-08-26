import 'package:flutter/material.dart';

import 'package:local_transport_bd/core/constants/constants.dart';

import 'icon_with_location_item.dart';

class LocationToDestinationWidget extends StatelessWidget {
  final String locationName;
  final String destinationName;
  final Color? textColor;
  final double? textSize;
  final double? iconSize;
  final bool? isLightVersion;
  final bool? isFlexible;
  const LocationToDestinationWidget({
    Key? key,
    required this.locationName,
    required this.destinationName,
    this.textColor,
    this.textSize,
    this.iconSize,
    this.isLightVersion,
    this.isFlexible = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      // mainAxisAlignment: isFlexible == true
      //     ? MainAxisAlignment.center
      //     : MainAxisAlignment.start,
      children: [
        Flexible(
          flex: isFlexible == true ? 1 : 0,
          child: IconWithLocationItem(
            mainAxisAlignment: MainAxisAlignment.end,
            icon: Icons.location_searching_rounded,
            iconColor: KColors.danger,
            location: locationName,
            textColor: isLightVersion == true
                ? (textColor ?? KColors.primary.shade100)
                : textColor,
            textSize: textSize,
            iconSize: textSize,
          ),
        ),
        Flexible(
          flex: isFlexible == true ? 1 : 0,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w),
            child: Icon(
              Icons.arrow_forward_ios,
              color:
                  isLightVersion == true ? KColors.grey : Colors.grey.shade600,
              size: iconSize ?? 12.w,
            ),
          ),
        ),
        Flexible(
          flex: isFlexible == true ? 1 : 0,
          child: IconWithLocationItem(
            mainAxisAlignment: MainAxisAlignment.start,
            icon: Icons.my_location_rounded,
            iconColor: KColors.success,
            location: destinationName,
            textColor: isLightVersion == true
                ? (textColor ?? KColors.primary.shade100)
                : textColor,
            textSize: textSize,
            iconSize: textSize,
          ),
        ),
      ],
    );
  }
}
