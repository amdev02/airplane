import 'package:flutter/material.dart';
import 'package:varana_apps/models/users_model.dart';
import 'package:varana_apps/pages/insight_markom_bulanan_page.dart';
import 'package:varana_apps/pages/insight_markom_harian_page.dart';
import 'package:varana_apps/pages/insight_markom_mingguan_page.dart';
import 'package:varana_apps/theme/thema.dart';

class InsightMarkom extends StatefulWidget {
  final UserModelInsight model;
  InsightMarkom(this.model);
  @override
  _InsightMarkomState createState() => _InsightMarkomState();
}

class _InsightMarkomState extends State<InsightMarkom> {
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
          InsightMarkomHarian(widget.model),
          InsightMarkomMingguan(widget.model),
          InsightMarkomBulanan(widget.model),
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
