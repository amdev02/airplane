import 'package:flutter/material.dart';
import 'package:varana_apps/pages/sales_cash_bertahap_page.dart';
import 'package:varana_apps/pages/sales_cash_keras_page.dart';
import 'package:varana_apps/pages/sales_kpr_page.dart';
import 'package:varana_apps/theme/thema.dart';

class SoldSales extends StatelessWidget {
  const SoldSales({Key? key}) : super(key: key);

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
          SalesKprPage(),
          SalesCashBertahapPage(),
          SalesCashKerasPage(),
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
