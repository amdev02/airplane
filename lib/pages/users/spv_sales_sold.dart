import 'package:flutter/material.dart';
import 'package:varana_apps/pages/spv_sales_cash_bertahap.dart';
import 'package:varana_apps/pages/spv_sales_cash_keras.dart';
import 'package:varana_apps/pages/spv_sales_kpr.dart';
import 'package:varana_apps/theme/thema.dart';

class SpvSalesSold extends StatelessWidget {
  const SpvSalesSold({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppBar header() {
      return AppBar(
        backgroundColor: kGreenColor,
        elevation: 1,
        title: Text(
          "Lead",
          style: whiteTextStyle.copyWith(
            fontSize: 16,
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
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
          SpvSalesKpr(),
          SpvSalesCashBertahap(),
          SpvSalesCashKeras(),
        ],
      );
    }

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: kWhiteColor,
        appBar: header(),
        body: body(),
      ),
    );
  }
}
