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
              hintText: widget.hintText ?? '',
              items: widget.items,
              controller: widget.controller,
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
