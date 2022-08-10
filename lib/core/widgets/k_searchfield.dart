import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:searchfield/searchfield.dart';

class KSearchField extends StatelessWidget {
  final String hintText;
  final List items;
  final TextEditingController controller;
  final bool? showClearIcon;
  final Function()? onSuffixIconTap;
  final Function(SearchFieldListItem<dynamic>)? onSuggestionTap;
  const KSearchField({
    Key? key,
    required this.hintText,
    required this.items,
    required this.controller,
    this.showClearIcon,
    this.onSuffixIconTap,
    this.onSuggestionTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SearchField(
      controller: controller,
      emptyWidget: Container(
        height: 55.h,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              blurRadius: 8.r,
              spreadRadius: 2.r,
              offset: const Offset(
                2.0,
                5.0,
              ),
            ),
          ],
        ),
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
      suggestionsDecoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 8.r,
            spreadRadius: 2.r,
            offset: const Offset(
              2.0,
              5.0,
            ),
          ),
        ],
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
      suggestionAction: SuggestionAction.next,
      onSuggestionTap: onSuggestionTap,
      searchInputDecoration: InputDecoration(
        suffixIconConstraints: BoxConstraints(
          maxWidth: 17.w,
        ),
        suffixIcon: showClearIcon == true
            ? GestureDetector(
                onTap: onSuffixIconTap,
                child: Icon(
                  Icons.close_rounded,
                  size: 17.w,
                  color: Colors.grey.shade400,
                ),
              )
            : null,
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
      itemHeight: 48.h,
    );
  }
}
