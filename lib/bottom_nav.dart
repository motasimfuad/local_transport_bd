import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../core/constants/colors.dart';
import 'features/home/presentation/pages/home_page.dart';
import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({Key? key}) : super(key: key);

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int currentIndex = 0;

  final screens = [
    const HomePage(),
    Container(),
    Container(),
  ];

  // @override
  // void initState() {
  //   FirebaseMessaging.onMessage.listen((message) {
  //     kSnackBar(
  //       context: context,
  //       durationSeconds: 4,
  //       message: message.notification?.body,
  //       icon: Icons.notifications_active,
  //     );
  //   });
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          showSelectedLabels: false,
          showUnselectedLabels: false,
          backgroundColor: Colors.white,
          unselectedItemColor: Colors.grey.shade400,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.dashboard_rounded),
              label: ('Home'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.bookmark_add_rounded),
              label: ('Search'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings_rounded),
              label: ('Favorite'),
            ),
          ],
          currentIndex: currentIndex,
          onTap: (index) {
            setState(() {
              currentIndex = index;
            });
          }),
    );
  }

  FloatingNavbar buildFloatingNavbar() {
    return FloatingNavbar(
      borderRadius: 0.w,
      itemBorderRadius: 15.w,
      margin: EdgeInsets.symmetric(
        horizontal: 0.h,
        vertical: 0.w,
      ),
      iconSize: 24.w,
      onTap: (int val) {
        setState(() {
          currentIndex = val;
        });
      },
      backgroundColor: Colors.black,
      selectedBackgroundColor: KColors.primaryDark,
      selectedItemColor: Colors.white,
      padding: EdgeInsets.only(
        bottom: 10.h,
        top: 10.h,
        left: 0.w,
        right: 0.w,
      ),
      currentIndex: currentIndex,
      items: [
        FloatingNavbarItem(
          icon: Icons.home,
        ),
        FloatingNavbarItem(
          icon: Icons.search_rounded,
        ),
        FloatingNavbarItem(
          icon: Icons.question_answer_outlined,
        ),
      ],
    );
  }
}
