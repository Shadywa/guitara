import 'package:flutter/material.dart';
import 'package:videocall/core/constants/color.dart';
import 'package:videocall/core/constants/typography.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          icon: Icon(Icons.arrow_back),
          color: AppColors.textPrimary,
          onPressed: () => Navigator.pop(context),
        ),
        Spacer(),
        Text(
          'CONTACTS',
          style: AppTextStyles.appBarTitle(MediaQuery.of(context).size.width),
        ),
        Spacer(),
        IconButton(
          icon: Icon(Icons.add),
          color: AppColors.textPrimary,
          onPressed: () {
            /*…*/
          },
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
