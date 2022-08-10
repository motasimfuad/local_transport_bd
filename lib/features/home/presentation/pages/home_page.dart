import 'package:flutter/material.dart';

import 'package:local_transport_bd/core/widgets/k_fab.dart';

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
      backgroundColor: KColors.primary.shade50,
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
            KLocationSelectWidget(
              areas: _areas,
              locationController: _locationController,
              destinationController: _destinationController,
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
