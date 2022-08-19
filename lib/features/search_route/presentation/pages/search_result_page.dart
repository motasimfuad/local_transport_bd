import 'package:flutter/material.dart';

import 'package:local_transport_bd/core/constants/constants.dart';
import 'package:local_transport_bd/core/widgets/k_badge.dart';
import 'package:local_transport_bd/core/widgets/k_card.dart';
import 'package:local_transport_bd/core/widgets/k_icon_button.dart';

import '../widgets/k_location_select_widget.dart';
import '../widgets/location_to_destination_widget.dart';

class SearchResultPage extends StatefulWidget {
  const SearchResultPage({Key? key}) : super(key: key);

  @override
  State<SearchResultPage> createState() => _SearchResultPageState();
}

class _SearchResultPageState extends State<SearchResultPage> {
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _destinationController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();

  // list of 30 local area name in dhaka city
  final List<String> _areas = [
    'Dhaka',
    'Gazipur',
    'Kishoreganj',
    'Madaripur',
    'Manikganj',
    'Munshiganj',
    'Narayanganj',
    'Narsingdi',
    'Rajbari',
    'Shariatpur',
    'Tangail',
    'Bagerhat',
    'Chuadanga',
    'Jessore',
    'Jhenaidah',
    'Khulna',
    'Kushtia',
    'Magura',
    'Meherpur',
    'Narail',
    'Satkhira',
    'Bogra',
    'Joypurhat',
    'Naogaon',
    'Natore',
    'Chapai Nawabganj',
    'Pabna',
    'Rajshahi',
    'Sirajganj',
    'Dinajpur',
    'Gaibandha',
    'Kurigram',
    'Lalmonirhat',
    'Nilphamari',
    'Panchagarh',
    'Rangpur',
    'Thakurgaon',
    'Habiganj',
    'Moulvibazar',
    'Sunamganj',
    'Sylhet',
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: KColors.primary.shade100,
        // appBar: const KAppbar(
        //   title: 'Search Result',
        // ),

        body: SafeArea(
          child: NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return [
                SliverAppBar(
                  pinned: true,
                  centerTitle: true,
                  title: LocationToDestinationWidget(
                    isLightVersion: innerBoxIsScrolled ? true : false,
                    isFlexible: true,
                    textSize: 18.sp,
                    textColor: innerBoxIsScrolled
                        ? KColors.primary.shade100
                        : KColors.primary,
                    locationName: 'Dhaka',
                    destinationName: 'Sylhet',
                  ),
                  // expandedHeight: MediaQuery.of(context).size.height * 0.3,
                  toolbarHeight: 55.w,
                  expandedHeight: 290.w,
                  flexibleSpace: FlexibleSpaceBar(
                    background: Container(
                      color: KColors.primary.shade100,
                      padding: EdgeInsets.only(
                        left: 20.w,
                        right: 20.w,
                        top: 50.w,
                        bottom: 10.w,
                      ),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Positioned(
                            left: 0,
                            right: 0,
                            child: KLocationSelectWidget(
                              areas: _areas,
                              locationController: _locationController,
                              destinationController: _destinationController,
                              cityController: _cityController,
                              onLocationBtnTap: () {
                                // router.pushNamed(AppRouter.searchResultPage);
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ];
            },
            body: CustomScrollView(
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              slivers: [
                // SliverPersistentHeader(
                //   delegate: KSliverHeaderDelegate(
                //     maxExtentHeight: 250.w,
                //     child: Container(
                //       color: KColors.primary.shade100,
                //       padding: EdgeInsets.only(
                //         left: 20.w,
                //         right: 20.w,
                //         top: 10.w,
                //         // bottom: 10.w,
                //       ),
                //       child: KLocationSelectWidget(
                //         areas: _areas,
                //         locationController: _locationController,
                //         destinationController: _destinationController,
                //         cityController: _cityController,
                //         onLocationBtnTap: () {
                //           // router.pushNamed(AppRouter.searchResultPage);
                //         },
                //       ),
                //     ),
                //   ),
                // ),

                // rest of the body
                SliverToBoxAdapter(
                  child: Container(
                    height: 40.w,
                    decoration: BoxDecoration(
                      color: KColors.primary.shade50,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25.w),
                        topRight: Radius.circular(25.w),
                      ),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                            left: 22.w,
                            // top: 5.w,
                            // bottom: 5.w,
                          ),
                          child: Text(
                            '10 Results found',
                            style: TextStyle(
                              color: KColors.primary.shade400,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Container(
                    color: KColors.background,
                    child: GridView.builder(
                      shrinkWrap: true,
                      primary: false,
                      padding: EdgeInsets.only(
                        left: 15.w,
                        right: 15.w,
                        // top: 15.w,
                        bottom: 15.w,
                      ),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 1,
                        mainAxisExtent: 120.w,
                        crossAxisSpacing: 15.w,
                        mainAxisSpacing: 15.w,
                      ),
                      itemCount: 10,
                      itemBuilder: (BuildContext context, int index) {
                        return const BusItem();
                      },
                    ),
                  ),
                )
              ],
            ),
          ),
        )
        // body: Column(
        //   children: [
        //     Stack(
        //       children: [
        //         Container(
        //           // height: 125.w,
        //           padding: EdgeInsets.only(
        //             bottom: 45.w,
        //             left: 20.w,
        //             right: 20.w,
        //             top: 5.w,
        //           ),
        //           color: KColors.primary.shade100,
        //           child: KLocationSelectWidget(
        //             areas: _areas,
        //             locationController: _locationController,
        //             destinationController: _destinationController,
        //             cityController: _cityController,
        //             onLocationBtnTap: () {
        //               // router.pushNamed(AppRouter.searchResultPage);
        //             },
        //           ),
        //           // child: const Center(
        //           //   child: LocationToDestinationWidget(
        //           //     isHeader: true,
        //           //     locationName: 'Dhaka',
        //           //     destinationName: 'Sylhet',
        //           //   ),
        //           // ),
        //         ),
        //         Positioned(
        //           bottom: -5,
        //           left: 0,
        //           right: 0,
        //           child: Container(
        //             height: 45.w,
        //             decoration: BoxDecoration(
        //               color: KColors.background,
        //               borderRadius: BorderRadius.only(
        //                 topLeft: Radius.circular(25.w),
        //                 topRight: Radius.circular(25.w),
        //               ),
        //             ),
        //             child: Row(
        //               crossAxisAlignment: CrossAxisAlignment.center,
        //               children: [
        //                 Padding(
        //                   padding: EdgeInsets.only(
        //                     left: 22.w,
        //                     // top: 5.w,
        //                     // bottom: 5.w,
        //                   ),
        //                   child: Text(
        //                     '10 Results found',
        //                     style: TextStyle(
        //                       color: KColors.primary.shade400,
        //                       fontSize: 14.sp,
        //                       fontWeight: FontWeight.w400,
        //                       fontStyle: FontStyle.italic,
        //                     ),
        //                   ),
        //                 ),
        //               ],
        //             ),
        //           ),
        //         ),
        //       ],
        //     ),
        //     Expanded(
        //       child: GridView.builder(
        //         padding: EdgeInsets.only(
        //           left: 15.w,
        //           right: 15.w,
        //           top: 15.w,
        //           bottom: 15.w,
        //         ),
        //         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        //           crossAxisCount: 1,
        //           mainAxisExtent: 120.w,
        //           crossAxisSpacing: 15.w,
        //           mainAxisSpacing: 15.w,
        //         ),
        //         itemCount: 10,
        //         itemBuilder: (BuildContext context, int index) {
        //           return const BusItem();
        //         },
        //       ),
        //     ),
        //   ],
        // ),
        );
  }
}

class BusItem extends StatelessWidget {
  const BusItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return KCard(
      xPadding: 0,
      yPadding: 0,
      radius: 20.r,
      color: Colors.white,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 14.w,
          vertical: 14.w,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            KBadge(
              badgeText: 'Local',
              badgeColor: KColors.warning,
              fontWeight: FontWeight.w600,
              radius: 15.r,
              textSize: 12.sp,
              yPadding: 4.w,
              xPadding: 10.w,
            ),
            SizedBox(height: 8.w),
            Text(
              'Turag Transport',
              style: TextStyle(
                fontSize: 17.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const LocationToDestinationWidget(
                  locationName: 'Dhaka',
                  destinationName: 'Sylhet',
                ),
                KIconButton(
                  bgColor: KColors.primary,
                  icon: Icons.arrow_forward_ios_rounded,
                  iconColor: Colors.white,
                  size: 15.w,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
