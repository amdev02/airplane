import 'package:flutter/material.dart';
import 'package:varana_apps/models/users_model.dart';
import 'package:varana_apps/pages/insight_sales_bulanan_page.dart';
import 'package:varana_apps/pages/insight_sales_harian_page.dart';
import 'package:varana_apps/pages/insight_sales_mingguan_page.dart';
import 'package:varana_apps/theme/thema.dart';

class InsightSalesPage extends StatefulWidget {
  final UserModelInsight model;
  InsightSalesPage(this.model);

  @override
  _InsightSalesPageState createState() => _InsightSalesPageState();
}

class _InsightSalesPageState extends State<InsightSalesPage> {
  @override
  Widget build(BuildContext context) {
    AppBar header() {
      return AppBar(
        backgroundColor: kGreenColor,
        title: Text(
          widget.model.nama_user!,
          style: whiteTextStyle.copyWith(fontSize: 16),
        ),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.arrow_back_ios),
        ),
        bottom: TabBar(
          indicatorColor: kBlueColor,
          tabs: [
            Tab(
              child: Text(
                "Harian",
                style: whiteTextStyle,
              ),
            ),
            Tab(
              child: Text(
                "Mingguan",
                style: whiteTextStyle,
              ),
            ),
            Tab(
              child: Text(
                "Bulanan",
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
          InsightSalesHarian(widget.model),
          InsightSalesMingguan(widget.model),
          InsightSalesBulanan(widget.model),
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
