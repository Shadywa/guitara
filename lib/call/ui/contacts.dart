import 'package:flutter/material.dart';
import 'package:videocall/call/data/models/talk.dart';
import 'package:videocall/call/ui/widgets/custom_app_bar.dart';
import 'package:videocall/call/ui/widgets/favoratites.dart';
import 'package:videocall/call/ui/widgets/recent.dart';
import 'package:videocall/call/ui/widgets/search_field.dart';
import 'package:videocall/core/constants/color.dart';
import 'package:videocall/core/constants/dimensions.dart';
import 'package:videocall/core/utilites/responsive.dart';

class ContactsPage extends StatelessWidget {
  final List<String> favAvatars = const [
    'assets/images/user.jpg',
    'assets/images/user.jpg',
    'assets/images/user.jpg',
    'assets/images/user.jpg',
    'assets/images/user.jpg',
    'assets/images/user.jpg',
    'assets/images/user.jpg',
    'assets/images/user.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.background,
        appBar: CustomAppBar(),
        body: SafeArea(
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.only(
                    top: Responsive.h(context, 0.02),
                    left: Responsive.w(context, Dimens.horizontalPadding),
                    right: Responsive.w(context, Dimens.horizontalPadding),
                  ),
                  child: SearchField(),
                ),
              ),
              SliverToBoxAdapter(child: FavouritesSection(avatars: favAvatars)),
              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: Responsive.w(context, Dimens.horizontalPadding),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 8,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    padding: EdgeInsets.symmetric(
                      vertical: Responsive.h(context, 0.04),
                      horizontal: Responsive.w(context, 0.04),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                            bottom: Responsive.h(context, 0.01),
                          ),
                          child: Text(
                            'Recent Calls',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: recentTalks.length,
                          itemBuilder:
                              (context, index) => RecentTalkItem(
                                talk: recentTalks[index],
                                screenWidth: screenWidth,
                              ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
