import 'package:flutter/material.dart';
import 'package:varana_apps/pages/markom_absen_all_page.dart';
import 'package:varana_apps/pages/markom_absen_today.dart';
import 'package:varana_apps/theme/thema.dart';

class MarkomAbsenPage extends StatefulWidget {
  const MarkomAbsenPage({Key? key}) : super(key: key);

  @override
  _MarkomAbsenPageState createState() => _MarkomAbsenPageState();
}

class _MarkomAbsenPageState extends State<MarkomAbsenPage> {
  @override
  Widget build(BuildContext context) {
    AppBar header() {
      return AppBar(
        backgroundColor: kGreenColor,
        elevation: 1,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(
            Icons.arrow_back_ios,
            size: 16,
          ),
        ),
        title: Text(
          "Absen dan Pamit",
          style: whiteTextStyle.copyWith(
            fontSize: 16,
          ),
        ),
        bottom: TabBar(
          indicatorColor: kBlueColor,
          indicatorWeight: 3,
          tabs: [
            Tab(
              child: Text(
                "Hari Ini",
                style: whiteTextStyle.copyWith(fontSize: 14),
              ),
            ),
            Tab(
              child: Text(
                "Semua",
                style: whiteTextStyle.copyWith(fontSize: 14),
              ),
            ),
          ],
        ),
      );
    }

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: header(),
        body: TabBarView(children: [
          MarkomAbsenTodayPage(),
          MarkomAbsenAllPage(),
        ]),
      ),
    );
  }
}
