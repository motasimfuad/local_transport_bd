import 'package:flutter/material.dart';

import '../../../../core/constants/constants.dart';
import '../../../../core/widgets/k_card.dart';
import 'k_single_location_select_field.dart';

class KLocationSelectWidget extends StatefulWidget {
  final List<String> areas;
  final TextEditingController locationController;
  final TextEditingController destinationController;
  const KLocationSelectWidget({
    Key? key,
    required this.areas,
    required this.locationController,
    required this.destinationController,
  }) : super(key: key);

  @override
  State<KLocationSelectWidget> createState() => _KLocationSelectWidgetState();
}

class _KLocationSelectWidgetState extends State<KLocationSelectWidget>
    with TickerProviderStateMixin {
  final GlobalKey _formKey = GlobalKey<FormState>();

  var tabItems = [
    {
      'name': 'Bus',
      'icon': Icons.bus_alert_rounded,
    },
    {
      'name': 'Boat',
      'icon': Icons.directions_boat_rounded,
    },
    {
      'name': 'Metro',
      'icon': Icons.train_rounded,
    }
  ];

  @override
  Widget build(BuildContext context) {
    TabController tabController =
        TabController(length: tabItems.length, vsync: this);
    return KCard(
      color: KColors.primary,
      radius: 25.r,
      xPadding: 0,
      yPadding: 0,
      xMargin: 20.w,
      yMargin: 20.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          KCard(
            xPadding: 0,
            yPadding: 0,
            radius: 0.r,
            hasShadow: false,
            // padding: EdgeInsets.only(left: 25.w),
            color: KColors.primary.shade200,
            child: tabItems.map((e) => e).toList().length > 2
                ? TabBar(
                    controller: tabController,
                    labelColor: KColors.primary.shade50,
                    unselectedLabelColor: KColors.primary.shade500,
                    labelPadding: EdgeInsets.symmetric(vertical: 0.h),
                    isScrollable: true,
                    labelStyle: TextStyle(
                      fontSize: 16.sp,
                    ),
                    padding: EdgeInsets.only(
                      top: 0.w,
                      left: 0.w,
                    ),
                    indicatorColor: Colors.amber,
                    indicatorSize: TabBarIndicatorSize.tab,
                    indicator: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                          // topLeft: Radius.circular(15.r),
                          // topRight: Radius.circular(15.r),
                          ),
                      color: KColors.primary.shade500,
                    ),
                    onTap: (value) {
                      if (value == 0) {
                        print(tabItems[value]['name']);
                      } else {
                        print('boat');
                      }
                    },
                    tabs: tabItems
                        .map(
                          (item) => Container(
                            // color: KColors.primary.shade500,
                            padding: EdgeInsets.symmetric(
                              horizontal: 18.w,
                            ),
                            child: Tab(
                              icon: Icon(
                                item['icon'] as IconData,
                                size: 20.w,
                              ),
                            ),
                          ),
                        )
                        .toList(),
                  )
                : const SizedBox(),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: 20.w,
              horizontal: 15.w,
            ),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  KSingleLocationSelectField(
                    icon: Icons.my_location_outlined,
                    items: widget.areas,
                    controller: widget.locationController,
                  ),
                  SizedBox(height: 15.w),
                  KSingleLocationSelectField(
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
