import 'package:flutter/material.dart';

import '../../../../core/constants/constants.dart';
import '../../../../core/widgets/k_card.dart';
import '../../../../core/widgets/k_searchfield.dart';

class KSingleLocationSelectField extends StatefulWidget {
  final IconData? icon;
  final List items;
  final TextEditingController controller;
  const KSingleLocationSelectField({
    Key? key,
    this.icon,
    required this.items,
    required this.controller,
  }) : super(key: key);

  @override
  State<KSingleLocationSelectField> createState() =>
      _KSingleLocationSelectFieldState();
}

class _KSingleLocationSelectFieldState
    extends State<KSingleLocationSelectField> {
  bool _showClearIcon = false;

  showIcon() {
    widget.controller.addListener(() {
      if (widget.controller.text.trim().isNotEmpty) {
        setState(() {
          _showClearIcon = true;
        });
      } else {
        setState(() {
          _showClearIcon = false;
        });
      }
    });
  }
  // show clear icon when controller.text is not empty

  @override
  void initState() {
    // showIcon();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return KCard(
      color: KColors.primary.shade50,
      xPadding: 12.w,
      yPadding: 0.w,
      hasShadow: false,
      radius: 16.r,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            widget.icon,
            size: 18.w,
            color: KColors.primary,
          ),
          SizedBox(width: 10.w),
          Expanded(
            child: KSearchField(
              hintText: 'Enter your location',
              items: widget.items,
              controller: widget.controller,
            ),
          ),
          _showClearIcon
              ? GestureDetector(
                  onTap: () {
                    widget.controller.clear();
                    print('tap');
                  },
                  child: Icon(
                    Icons.close,
                    color: Colors.grey.shade400,
                  ),
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}
