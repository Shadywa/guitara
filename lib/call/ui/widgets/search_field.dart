import 'package:flutter/material.dart';
import 'package:videocall/core/constants/color.dart';
import 'package:videocall/core/constants/dimensions.dart';
import 'package:videocall/core/constants/typography.dart';
import 'package:videocall/core/utilites/responsive.dart';

class SearchField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    return Container(
      height: Responsive.h(context, Dimens.searchBarHeight),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(
          Responsive.w(context, Dimens.searchBarRadius),
        ),
      ),
      child: Row(
        children: [
          SizedBox(width: Responsive.w(context, Dimens.horizontalPadding)),
          Icon(Icons.search, color: AppColors.icon),
          SizedBox(width: Responsive.w(context, 0.02)),
          Expanded(
            child: TextField(
              style: AppTextStyles.body(w),
              decoration: InputDecoration(
                isCollapsed: true,
                border: InputBorder.none,
                hintText: 'Search your contacts',
                hintStyle: AppTextStyles.hint(w),
              ),
            ),
          ),
          Icon(Icons.mic, color: AppColors.icon),
          SizedBox(width: Responsive.w(context, Dimens.horizontalPadding)),
        ],
      ),
    );
  }
}
