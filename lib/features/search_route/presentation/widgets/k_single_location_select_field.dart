import 'package:flutter/material.dart';

import '../../../../core/constants/constants.dart';
import '../../../../core/widgets/k_card.dart';
import '../../../../core/widgets/k_searchfield.dart';

class KSingleLocationSelectField extends StatefulWidget {
  final IconData? icon;
  final String? hintText;
  final List items;
  final TextEditingController controller;
  const KSingleLocationSelectField({
    Key? key,
    this.icon,
    this.hintText,
    required this.items,
    required this.controller,
  }) : super(key: key);

  @override
  State<KSingleLocationSelectField> createState() =>
      _KSingleLocationSelectFieldState();
}

class _KSingleLocationSelectFieldState
    extends State<KSingleLocationSelectField> {
  @override
  Widget build(BuildContext context) {
    return KCard(
      color: KColors.primary.shade50.withOpacity(0.9),
      xPadding: 5.w,
      yPadding: 0.w,
      hasShadow: false,
      radius: 18.r,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // Icon(
          //   widget.icon,
          //   size: 18.w,
          //   color: KColors.primary,
          // ),
          // SizedBox(width: 10.w),
          Expanded(
            child: KSearchField(
              hintText: widget.hintText ?? '',
              items: widget.items,
              icon: widget.icon,
              controller: widget.controller,
              goNextOnSelect: true,
              showClearIcon: widget.controller.text.isNotEmpty,
              onSuffixIconTap: () {
                widget.controller.clear();
                setState(() {});
              },
              onSuggestionTap: (p0) {
                setState(() {});
              },
            ),
          ),
        ],
      ),
    );
  }
}
