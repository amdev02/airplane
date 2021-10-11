import 'package:flutter/material.dart';
import 'package:varana_apps/pages/Sales_new_lead_page.dart';
import 'package:varana_apps/pages/sales_booking_page.dart';
import 'package:varana_apps/pages/sales_follow_up_page.dart';
import 'package:varana_apps/pages/sales_pending_page.dart';
import 'package:varana_apps/pages/sales_reservasi_page.dart';
import 'package:varana_apps/theme/thema.dart';

class LeadSales extends StatelessWidget {
  const LeadSales({Key? key}) : super(key: key);

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
          SalesPendingPage(),
          SalesNewLeadPage(),
          SalesFollowUpPage(),
          SalesReservasiPage(),
          SalesBookingPage(),
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
