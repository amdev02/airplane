import 'package:flutter/material.dart';
import 'package:varana_apps/pages/hm_user_head_markom_page.dart';
import 'package:varana_apps/pages/hm_user_markom_page.dart';
import 'package:varana_apps/pages/hm_user_owner_page.dart';
import 'package:varana_apps/pages/hm_user_spv_page.dart';
import 'package:varana_apps/theme/thema.dart';

class HmUsersPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AppBar header() {
      return AppBar(
        backgroundColor: kGreenColor,
        elevation: 1,
        title: Text(
          "Users",
          style: whiteTextStyle.copyWith(
            fontSize: 16,
          ),
        ),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(
            Icons.arrow_back_ios,
            size: 16,
          ),
        ),
        bottom: TabBar(
          isScrollable: true,
          indicatorColor: kBlueColor,
          tabs: [
            Tab(
              child: Text(
                "Markom",
                style: whiteTextStyle,
              ),
            ),
            Tab(
              child: Text(
                "Head Markom",
                style: whiteTextStyle,
              ),
            ),
            Tab(
              child: Text(
                "Supervisior",
                style: whiteTextStyle,
              ),
            ),
            Tab(
              child: Text(
                "Owner",
                style: whiteTextStyle,
              ),
            ),
          ],
        ),
      );
    }

    Widget body() {
      return TabBarView(
        children: [
          HmUserMarkomPage(),
          HmUserHeadMarkomPage(),
          HmUserSpvPage(),
          HmUserOwnerPage(),
        ],
      );
    }

    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: kWhiteColor,
        appBar: header(),
        body: body(),
      ),
    );
  }
}
