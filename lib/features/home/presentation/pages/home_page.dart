import 'package:flutter/material.dart';
import 'package:local_transport_bd/core/router/app_router.dart';
import 'package:local_transport_bd/core/widgets/k_card.dart';
import 'package:local_transport_bd/core/widgets/k_icon_button.dart';
import 'package:local_transport_bd/core/widgets/k_searchfield.dart';

import '../../../../core/constants/constants.dart';
import '../../../search_route/presentation/widgets/k_location_select_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: KColors.primary.shade50,
      body: SafeArea(
        child: SingleChildScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          child: Container(
            height: MediaQuery.of(context).size.height - 40.w,
            padding: EdgeInsets.only(
              top: 10.w,
              left: 20.w,
              right: 20.w,
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    KCard(
                      xPadding: 0,
                      yPadding: 0,
                      width: 200.w,
                      hasShadow: false,
                      color: KColors.primary.withOpacity(0.0),
                      child: KSearchField(
                        items: _areas,
                        hintText: 'City',
                        controller: _cityController,
                      ),
                    ),
                    KIconButton(
                      icon: Icons.settings,
                      bgColor: KColors.primary.withOpacity(0.1),
                      onPressed: () {
                        print('Setting');
                      },
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 0.h),
                  child: Column(
                    children: [
                      KLocationSelectWidget(
                        areas: _areas,
                        locationController: _locationController,
                        destinationController: _destinationController,
                        cityController: _cityController,
                        onLocationBtnTap: () {
                          router.pushNamed(AppRouter.searchResultPage);
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
