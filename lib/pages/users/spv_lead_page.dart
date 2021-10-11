import 'package:flutter/material.dart';
import 'package:varana_apps/pages/spv_booking_page.dart';
import 'package:varana_apps/pages/spv_follow_up_page.dart';
import 'package:varana_apps/pages/spv_new_lead_page.dart';
import 'package:varana_apps/pages/spv_pending_page.dart';
import 'package:varana_apps/pages/spv_reservasi_page.dart';
import 'package:varana_apps/theme/thema.dart';

class SpvLeadPage extends StatelessWidget {
  const SpvLeadPage({Key? key}) : super(key: key);

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
                "Pending",
                style: whiteTextStyle,
              ),
            ),
            Tab(
              child: Text(
                "New Lead",
                style: whiteTextStyle,
              ),
            ),
            Tab(
              child: Text(
                "Follow Up",
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
          SpvPendingPage(),
          SpvNewLeadPage(),
          SpvFollowUpPage(),
          SpvReservasiPage(),
          SpvBookingPage(),
        ],
      );
    }

    return DefaultTabController(
      length: 5,
      child: Scaffold(
        backgroundColor: kWhiteColor,
        appBar: header(),
        body: body(),
      ),
    );
  }
}
