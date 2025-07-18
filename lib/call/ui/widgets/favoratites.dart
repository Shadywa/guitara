import 'package:flutter/material.dart';
import 'package:videocall/core/utilites/responsive.dart';
import '../../../core/constants/dimensions.dart';
import '../../../core/constants/typography.dart';

class FavouritesSection extends StatelessWidget {
  final List<String> avatars;

  const FavouritesSection({Key? key, required this.avatars}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenW = MediaQuery.of(context).size.width;
    final radius = Responsive.w(context, 0.12);

    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: Responsive.w(context, Dimens.horizontalPadding),
        vertical: Responsive.h(context, 0.02),
      ),
      padding: EdgeInsets.all(Responsive.w(context, 0.04)),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(Responsive.w(context, 0.04)),
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 8, offset: Offset(0, 4)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'FAVOURITE',
            style: AppTextStyles.body(
              screenW,
            ).copyWith(fontWeight: FontWeight.bold),
          ),
          SizedBox(height: Responsive.h(context, 0.015)),
          SizedBox(
            height: radius * 2,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: avatars.length,
              separatorBuilder:
                  (_, __) => SizedBox(width: Responsive.w(context, 0.03)),
              itemBuilder: (_, idx) {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    avatars[idx],
                    width: 50,
                    height: 30,
                    fit: BoxFit.cover,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
