import 'package:flutter/material.dart';
import 'package:videocall/call/data/models/talk.dart';
import 'package:videocall/call/ui/call_screen.dart';
import 'package:videocall/core/constants/color.dart';
import 'package:videocall/core/constants/dimensions.dart';
import 'package:videocall/core/constants/typography.dart';
import 'package:videocall/core/utilites/responsive.dart';

class RecentTalkItem extends StatelessWidget {
  final Talk talk;
  final double screenWidth;

  const RecentTalkItem({
    Key? key,
    required this.talk,
    required this.screenWidth,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: Responsive.h(context, 0.007)),
      padding: EdgeInsets.all(Responsive.w(context, 0.03)),
      decoration: BoxDecoration(
        color: Colors.grey[20],
        borderRadius: BorderRadius.circular(
          Responsive.w(context, Dimens.searchBarRadius),
        ),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: Image.network(
              talk.imageUrl,
              width: Responsive.w(context, 0.12),
              height: Responsive.w(context, 0.12),
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: Responsive.w(context, 0.04)),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  talk.name,
                  style: AppTextStyles.body(
                    screenWidth,
                  ).copyWith(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: Responsive.h(context, 0.005)),
                Text(talk.phone, style: AppTextStyles.hint(screenWidth)),
              ],
            ),
          ),
          CircleAvatar(
            backgroundColor: Colors.blue,
            radius: Responsive.w(context, 0.045),
            child: IconButton(
              icon: Icon(Icons.call, size: Responsive.w(context, 0.045)),
              color: Colors.white,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CallScreen()),
                );
              },
              padding: EdgeInsets.zero,
              constraints: BoxConstraints(),
            ),
          ),
          SizedBox(width: Responsive.w(context, 0.015)),
          CircleAvatar(
            backgroundColor: Colors.blue.withOpacity(0.15),
            radius: Responsive.w(context, 0.045),
            child: IconButton(
              icon: Icon(Icons.videocam, size: Responsive.w(context, 0.045)),
              color: AppColors.icon,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CallScreen()),
                );
              },
              padding: EdgeInsets.zero,
              constraints: BoxConstraints(),
            ),
          ),
        ],
      ),
    );
  }
}
