import 'package:flutter/material.dart';
import 'package:local_transport_bd/core/constants/constants.dart';
import 'package:local_transport_bd/core/widgets/k_appbar.dart';

class SearchResultPage extends StatelessWidget {
  const SearchResultPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const KAppbar(
        title: 'Search Result',
      ),
      body: Column(
        children: [
          Container(
            height: 200.w,
            color: KColors.primary,
          ),
          const Text('Search Result'),
        ],
      ),
    );
  }
}
