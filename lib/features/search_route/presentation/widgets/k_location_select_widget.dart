import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'package:local_transport_bd/core/widgets/k_icon_button.dart';
import 'package:local_transport_bd/l10n/locale_keys.g.dart';

import '../../../../core/constants/constants.dart';
import '../../../../core/widgets/k_card.dart';
import 'k_single_location_select_field.dart';

class KLocationSelectWidget extends StatefulWidget {
  final List<String> areas;
  final TextEditingController locationController;
  final TextEditingController destinationController;
  final TextEditingController cityController;
  final Function() onLocationBtnTap;
  const KLocationSelectWidget({
    Key? key,
    required this.areas,
    required this.locationController,
    required this.destinationController,
    required this.cityController,
    required this.onLocationBtnTap,
  }) : super(key: key);

  @override
  State<KLocationSelectWidget> createState() => _KLocationSelectWidgetState();
}

class _KLocationSelectWidgetState extends State<KLocationSelectWidget>
    with TickerProviderStateMixin {
  final GlobalKey _formKey = GlobalKey<FormState>();

  bool hasData = false;

  checkFields() {
    if (widget.locationController.text.trim().isNotEmpty &&
        widget.destinationController.text.trim().isNotEmpty &&
        widget.cityController.text.isNotEmpty) {
      setState(() {
        hasData = true;
      });
    } else {
      setState(() {
        hasData = false;
      });
    }
  }

  var tabItems = [
    {
      'name': 'Bus',
      'icon': Icons.directions_bus,
    },
    {
      'name': 'Boat',
      'icon': Icons.directions_boat_rounded,
    },
    {
      'name': 'Metro',
      'icon': Icons.train_rounded,
    },
  ];

  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(
      length: tabItems.length,
      vsync: this,
    );

    return KCard(
      radius: 25.r,
      xPadding: 0,
      yPadding: 0,
      xMargin: 0,
      yMargin: 10.w,
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          KCard(
            xPadding: 0,
            yPadding: 0,
            radius: 0.r,
            hasShadow: false,
            yMargin: 0,
            xMargin: 0,
            // color: KColors.primary.shade500,
            color: KColors.primary,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TabBar(
                  controller: tabController,
                  labelColor: KColors.primary.shade50,
                  unselectedLabelColor: KColors.primary.shade300,
                  labelPadding: EdgeInsets.symmetric(vertical: 0.h),
                  isScrollable: true,
                  splashBorderRadius: BorderRadius.circular(20.r),
                  indicatorWeight: 0,
                  indicatorPadding: EdgeInsets.symmetric(
                    vertical: 0.h,
                  ),
                  indicator: const BoxDecoration(),
                  onTap: (value) {
                    print(tabItems[value]['name']);
                  },
                  tabs: tabItems
                      .map(
                        (item) => Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 18.w,
                          ),
                          child: Tooltip(
                            message: item['name'] as String,
                            decoration: BoxDecoration(
                              color: KColors.primary.shade400,
                              borderRadius: BorderRadius.circular(15.r),
                            ),
                            showDuration: const Duration(milliseconds: 300),
                            preferBelow: false,
                            child: Tab(
                              iconMargin: const EdgeInsets.all(0),
                              icon: Icon(
                                item['icon'] as IconData,
                                size: 20.w,
                              ),
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ),
                Padding(
                  padding: EdgeInsets.all(8.w),
                  child: KIconButton(
                    iconColor: KColors.primary.shade50,
                    icon: Icons.search,
                    bgColor: KColors.primary.shade400,
                    radius: 15.r,
                    onPressed: widget.onLocationBtnTap,
                    // onPressed:() {
                    //   checkFields();
                    //   if (hasData) {
                    //     print('has data');
                    //   } else {
                    //     print('no data');
                    //   }
                    // },
                  ),
                ),
              ],
            ),
          ),
          Divider(
            color: KColors.primary.shade300,
            height: 0,
            thickness: 0.5,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: 15.w,
              horizontal: 15.w,
            ),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  KSingleLocationSelectField(
                    icon: Icons.my_location_outlined,
                    items: widget.areas,
                    hintText: LocaleKeys.label_location.tr(),
                    controller: widget.locationController,
                  ),
                  SizedBox(height: 15.w),
                  KSingleLocationSelectField(
                    hintText: LocaleKeys.label_destination.tr(),
                    icon: Icons.location_on_rounded,
                    items: widget.areas,
                    controller: widget.destinationController,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
