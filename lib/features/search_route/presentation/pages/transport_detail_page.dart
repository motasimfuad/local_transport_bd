import 'package:flutter/material.dart';
import 'package:local_transport_bd/core/widgets/k_appbar.dart';

class TransportDetailPage extends StatelessWidget {
  final String id;
  const TransportDetailPage({
    Key? key,
    required this.id,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: KAppbar(title: 'Transport Detail'),
      body: Center(
        child: Text('Transport Detail'),
      ),
    );
  }
}
