import 'package:flutter/material.dart';
import 'package:varana_apps/pages/spv_akan_datang_page.dart';
import 'package:varana_apps/pages/spv_sudah_datang_page.dart';
import 'package:varana_apps/theme/thema.dart';

class SpvVisitPage extends StatelessWidget {
  const SpvVisitPage({Key? key}) : super(key: key);

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
          SpvAkanDatang(),
          SpvSudahDatangPage(),
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
