import 'package:flutter/material.dart';
import 'package:varana_apps/pages/owner_akan_visit_page.dart';
import 'package:varana_apps/pages/owner_booking_page.dart';
import 'package:varana_apps/pages/owner_reservasi_page.dart';
import 'package:varana_apps/pages/owner_sudah_visit_page.dart';
import 'package:varana_apps/theme/thema.dart';

class OwnerLeadPage extends StatefulWidget {
  const OwnerLeadPage({Key? key}) : super(key: key);

  @override
  _OwnerLeadPageState createState() => _OwnerLeadPageState();
}

class _OwnerLeadPageState extends State<OwnerLeadPage> {
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
        bottom: TabBar(
          isScrollable: true,
          indicatorColor: kBlueColor,
          tabs: [
            Tab(
              child: Text(
                "Akan Visit",
                style: whiteTextStyle,
              ),
            ),
            Tab(
              child: Text(
                "Sudah Visit",
                style: whiteTextStyle,
              ),
            ),
            Tab(
              child: Text(
                "Reservasi",
                style: whiteTextStyle,
              ),
            ),
            Tab(
              child: Text(
                "Booking",
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
          OwnerAkanVisitPage(),
          OwnerSudahVisitPage(),
          OwnerReservasiPage(),
          OwnerBookingPage(),
        ],
      );
    }

    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: kWhiteColor,
        appBar: header(),
        body: body(),
      ),
    );
  }
}
