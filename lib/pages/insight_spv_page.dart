import 'package:flutter/material.dart';
import 'package:varana_apps/models/users_model.dart';
import 'package:varana_apps/pages/insight_spv_bulanan.dart';
import 'package:varana_apps/pages/insight_spv_harian.dart';
import 'package:varana_apps/pages/insight_spv_mingguan.dart';
import 'package:varana_apps/theme/thema.dart';

class InsightSpvPage extends StatefulWidget {
  final UserModelInsight model;
  InsightSpvPage(this.model);
  @override
  _InsightSpvPageState createState() => _InsightSpvPageState();
}

class _InsightSpvPageState extends State<InsightSpvPage> {
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
          InsightSpvHarian(widget.model),
          InsightSpvMingguan(widget.model),
          InsightSpvBulanan(widget.model),
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
