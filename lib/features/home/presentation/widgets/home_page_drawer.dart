import 'package:flutter/material.dart';
import 'package:local_transport_bd/core/constants/constants.dart';

class HomePageDrawer extends StatelessWidget {
  const HomePageDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.6,
      height: MediaQuery.of(context).size.height,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),
      child: Drawer(
        child: ListView(
          shrinkWrap: true,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: KColors.primary,
              ),
              child: Text('Drawer Header'),
            ),
            ListTile(
              visualDensity: VisualDensity.compact,
              title: const Text('Search Transport'),
              leading: Icon(
                Icons.ac_unit_outlined,
                size: 20.w,
              ),
              minVerticalPadding: 0,
              minLeadingWidth: 25,
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Dua'),
              visualDensity: VisualDensity.compact,
              leading: Icon(
                Icons.ac_unit_outlined,
                size: 20.w,
              ),
              minVerticalPadding: 0,
              minLeadingWidth: 25,
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Traffic rules'),
              visualDensity: VisualDensity.compact,
              leading: Icon(
                Icons.ac_unit_outlined,
                size: 20.w,
              ),
              minVerticalPadding: 0,
              minLeadingWidth: 25,
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
