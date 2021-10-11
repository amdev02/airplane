import 'package:flutter/material.dart';
import 'package:varana_apps/pages/add_lead_page.dart';
import 'package:varana_apps/pages/markom_booking_page.dart';
import 'package:varana_apps/pages/markom_follow_up_page.dart';
import 'package:varana_apps/pages/markom_new_lead_page.dart';
import 'package:varana_apps/pages/markom_pending_page.dart';
import 'package:varana_apps/pages/markom_reservasi_page.dart';
import 'package:varana_apps/theme/thema.dart';

class MarkomLeadPage extends StatelessWidget {
  const MarkomLeadPage({Key? key}) : super(key: key);

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
          MarkomPendingPage(),
          MarkomNewLeadPage(),
          MarkomFollowUpPage(),
          MarkomReservasiPage(),
          MarkomBookingPage(),
        ],
      );
    }

    return DefaultTabController(
      length: 5,
      child: Scaffold(
        backgroundColor: kWhiteColor,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => AddLeadPage()));
          },
          backgroundColor: kBlueColor,
          child: Icon(
            Icons.add,
            color: kWhiteColor,
          ),
        ),
        appBar: header(),
        body: body(),
      ),
    );
  }
}
