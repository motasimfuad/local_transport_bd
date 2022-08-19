import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class KSliverHeaderDelegate extends SliverPersistentHeaderDelegate {
  final Widget child;
  final double? maxExtentHeight;
  KSliverHeaderDelegate({
    required this.child,
    this.maxExtentHeight,
  });

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox(
      height: 300,
      child: Column(
        // fit: StackFit.expand,
        children: [
          AppBar(
            title: const Text('Title'),
            elevation: 0,
            // backgroundColor: Colors.transparent,
          ),
          SizedBox(
            child: child,
          ),
        ],
      ),
    );
  }

  @override
  double get maxExtent => maxExtentHeight ?? 180.h;

  @override
  double get minExtent => 80;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
