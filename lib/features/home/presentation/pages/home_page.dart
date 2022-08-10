import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:local_transport_bd/core/constants/colors.dart';
import 'package:local_transport_bd/core/widgets/k_fab.dart';
import 'package:local_transport_bd/core/widgets/k_searchfield.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey _formKey = GlobalKey<FormState>();
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _destinationController = TextEditingController();

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
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: const Text('home'),
      ),
      floatingActionButton: KFab(
          label: 'hi',
          onPressed: () {
            print(_locationController.text);
          }),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: Colors.red,
            ),
            Container(
              // color: KColors.primary,
              child: Padding(
                padding: EdgeInsets.all(15.w),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      KLocationSelectField(
                        icon: Icons.my_location_outlined,
                        items: _areas,
                        controller: _locationController,
                      ),
                      // SizedBox(height: 15.w),
                      // const KLocationSelectField(
                      //   icon: Icons.location_on_rounded,
                      // ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 55.h,
            ),
          ],
        ),
      ),
    );
  }
}

class KLocationSelectField extends StatelessWidget {
  final IconData? icon;
  final List items;
  final TextEditingController controller;
  const KLocationSelectField({
    Key? key,
    this.icon,
    required this.items,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          color: KColors.primary,
        ),
        SizedBox(width: 10.w),
        Expanded(
          child: KSearchField(
            hintText: '',
            items: items,
            controller: controller,
          ),
        ),
        // Expanded(
        //   child: KTextField(
        //     bgColor: Colors.grey.shade100,
        //     bottomPadding: 0,
        //   ),
        // ),
      ],
    );
  }
}
