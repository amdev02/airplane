import 'package:flutter/material.dart';
import 'package:varana_apps/pages/markom_akan_visit_page.dart';
import 'package:varana_apps/pages/markom_sudah_visit_markom.dart';
import 'package:varana_apps/theme/thema.dart';

class MarkomVisitPage extends StatelessWidget {
  const MarkomVisitPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppBar header() {
      return AppBar(
        backgroundColor: kGreenColor,
        elevation: 1,
        title: Text(
          "Visit",
          style: whiteTextStyle.copyWith(
            fontSize: 16,
          ),
        ),
        bottom: TabBar(
          indicatorColor: kBlueColor,
          tabs: [
            Tab(
              child: Text(
                "Akan Datang",
                style: whiteTextStyle,
              ),
            ),
            Tab(
              child: Text(
                "Sudah Datang",
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
          MarkomAkanVisitPage(),
          MarkomSudahVisitPage(),
        ],
      );
    }

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: header(),
        body: body(),
      ),
    );
  }
}
