import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:searchfield/searchfield.dart';

import 'package:local_transport_bd/core/constants/colors.dart';

class KSearchField extends StatelessWidget {
  final String? hintText;
  final List items;
  final TextEditingController controller;
  final bool? showClearIcon;
  final Color? bgColor;
  final IconData? icon;
  final bool? goNextOnSelect;
  final Function()? onSuffixIconTap;
  final Function(SearchFieldListItem<dynamic>)? onSuggestionTap;
  const KSearchField({
    Key? key,
    this.hintText,
    required this.items,
    required this.controller,
    this.showClearIcon = false,
    this.bgColor,
    this.icon,
    this.goNextOnSelect = false,
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
          color: KColors.primary.shade100.withOpacity(.8),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              blurRadius: 8.r,
              spreadRadius: 2.r,
              offset: const Offset(
                2.0,
                4.0,
              ),
            ),
          ],
        ),
        child: Center(
          child: Text(
            'No results found!',
            style: TextStyle(
              color: Colors.grey.shade700,
              fontStyle: FontStyle.italic,
              fontSize: 14.sp,
            ),
          ),
        ),
      ),
      suggestionItemDecoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: KColors.primary.shade500.withOpacity(.3),
            width: 0.3,
          ),
        ),
      ),
      suggestionsDecoration: BoxDecoration(
        color: KColors.primary.shade100.withOpacity(.8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 8.r,
            spreadRadius: 2.r,
            offset: const Offset(
              2.0,
              4.0,
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
        color: Colors.black.withOpacity(0.7),
      ),
      validator: (x) {
        if (!items.contains(x) || x!.isEmpty) {
          return 'Please Enter a valid State';
        }
        return null;
      },
      suggestionAction: goNextOnSelect == true
          ? SuggestionAction.next
          : SuggestionAction.unfocus,
      onSuggestionTap: onSuggestionTap,
      searchInputDecoration: InputDecoration(
        filled: true,
        fillColor: bgColor ?? Colors.transparent,
        contentPadding: EdgeInsets.symmetric(
          vertical: 12.h,
        ),
        prefixIcon: Icon(
          icon ?? Icons.location_city_rounded,
          size: 18.w,
          color: KColors.primary,
        ),
        prefixIconConstraints: BoxConstraints(
          minWidth: 35.w,
          maxWidth: 45.w,
        ),
        hintStyle: TextStyle(
          fontSize: 17.sp,
          color: Colors.black.withOpacity(0.3),
        ),
        prefixIconColor: KColors.primary,
        suffixIconConstraints: BoxConstraints(
          maxWidth: 30.w,
          minWidth: 25.w,
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
        border: InputBorder.none,
      ),
      maxSuggestionsInViewPort: 6,
      itemHeight: 48.h,
    );
  }
}
