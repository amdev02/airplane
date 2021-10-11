import 'package:flutter/material.dart';
import 'package:varana_apps/pages/markom_sold_cash_bertahap_page.dart';
import 'package:varana_apps/pages/markom_sold_cash_keras_page.dart';
import 'package:varana_apps/pages/markom_sold_kpr_page.dart';
import 'package:varana_apps/theme/thema.dart';

class MarkomSoldPage extends StatelessWidget {
  const MarkomSoldPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppBar header() {
      return AppBar(
        backgroundColor: kGreenColor,
        elevation: 1,
        title: Text(
          "Sold",
          style: whiteTextStyle.copyWith(
            fontSize: 16,
          ),
        ),
        bottom: TabBar(
          indicatorColor: kBlueColor,
          tabs: [
            Tab(
              child: Text(
                "KPR",
                style: whiteTextStyle,
              ),
            ),
            Tab(
              child: Text(
                "Cash Bertahap",
                style: whiteTextStyle,
              ),
            ),
            Tab(
              child: Text(
                "Cash Keras",
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
          MarkomSoldKprPage(),
          MarkomSoldCashBertahapPage(),
          MarkomSoldCashKeras(),
        ],
      );
    }

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: header(),
        body: body(),
      ),
    );
  }
}
