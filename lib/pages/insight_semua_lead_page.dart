import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:varana_apps/pages/insight_semua_lead_bulanan_page.dart';
import 'package:varana_apps/pages/insight_semua_lead_harian_page.dart';
import 'package:varana_apps/pages/insight_semua_lead_mingguan_page.dart';
import 'package:varana_apps/theme/thema.dart';

class InsightSemuaLead extends StatefulWidget {
  @override
  _InsightSemuaLeadState createState() => _InsightSemuaLeadState();
}

class _InsightSemuaLeadState extends State<InsightSemuaLead> {
  @override
  Widget build(BuildContext context) {
    AppBar header() {
      return AppBar(
        backgroundColor: kGreenColor,
        title: Text(
          "Semua Lead",
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
          InsightSemuaLeadHarian(),
          InsightSemuaLeadMingguan(),
          InsightSemuaLeadBulanan(),
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
