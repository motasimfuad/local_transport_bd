import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:searchfield/searchfield.dart';

class KSearchField extends StatelessWidget {
  final String hintText;
  final List items;
  final TextEditingController controller;
  const KSearchField({
    Key? key,
    required this.hintText,
    required this.items,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SearchField(
      controller: controller,
      emptyWidget: SizedBox(
        height: 55.h,
        child: Center(
          child: Text(
            'No results found!',
            style: TextStyle(
              color: Colors.grey,
              fontStyle: FontStyle.italic,
              fontSize: 14.sp,
            ),
          ),
        ),
      ),
      suggestions: items.map((e) => SearchFieldListItem(e)).toList(),
      suggestionState: Suggestion.hidden,
      textInputAction: TextInputAction.next,
      hint: hintText,
      hasOverlay: true,
      searchStyle: TextStyle(
        fontSize: 17.sp,
        color: Colors.black.withOpacity(0.8),
      ),
      validator: (x) {
        if (!items.contains(x) || x!.isEmpty) {
          return 'Please Enter a valid State';
        }
        return null;
      },
      searchInputDecoration: const InputDecoration(
        enabledBorder: InputBorder.none,
        focusedBorder: InputBorder.none,
        // focusedBorder: OutlineInputBorder(
        //   borderSide: BorderSide(
        //     color: Colors.black.withOpacity(0.8),
        //   ),
        // ),
        // border: OutlineInputBorder(
        //   borderSide: BorderSide(
        //     color: Colors.red,
        //   ),
        // ),
      ),
      maxSuggestionsInViewPort: 6,
      itemHeight: 50.h,
    );
  }
}
