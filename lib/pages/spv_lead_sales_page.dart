import 'package:flutter/material.dart';
import 'package:varana_apps/pages/spv_sales_akan_datang.dart';
import 'package:varana_apps/pages/spv_sales_booking.dart';
import 'package:varana_apps/pages/spv_sales_follow_up.dart';
import 'package:varana_apps/pages/spv_sales_new_lead.dart';
import 'package:varana_apps/pages/spv_sales_pending.dart';
import 'package:varana_apps/pages/spv_sales_reservasi.dart';
import 'package:varana_apps/pages/spv_sales_sudah_datang.dart';
import 'package:varana_apps/theme/thema.dart';

class SpvLeadSalesPage extends StatelessWidget {
  const SpvLeadSalesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppBar header() {
      return AppBar(
        backgroundColor: kGreenColor,
        elevation: 1,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            size: 16,
          ),
        ),
        title: Text(
          "Lead Sales Anda",
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
                'Pending',
                style: whiteTextStyle,
              ),
            ),
            Tab(
              child: Text(
                'New Lead',
                style: whiteTextStyle,
              ),
            ),
            Tab(
              child: Text(
                'Follow Up',
                style: whiteTextStyle,
              ),
            ),
            Tab(
              child: Text(
                'Akan Datang',
                style: whiteTextStyle,
              ),
            ),
            Tab(
              child: Text(
                'Sudah Datang',
                style: whiteTextStyle,
              ),
            ),
            Tab(
              child: Text(
                'Reservasi',
                style: whiteTextStyle,
              ),
            ),
            Tab(
              child: Text(
                'Booking',
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
          SpvSalesPending(),
          SpvSalesNewLead(),
          SpvSalesFollowUp(),
          SpvSalesAkanDatang(),
          SpvSalesSudahDatang(),
          SpvSalesReservasi(),
          SpvSalesBooking(),
        ],
      );
    }

    return DefaultTabController(
      length: 7,
      child: Scaffold(
        backgroundColor: kWhiteColor,
        appBar: header(),
        body: body(),
      ),
    );
  }
}
