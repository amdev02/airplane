import 'package:flutter/material.dart';
import 'package:varana_apps/pages/insight_markom_page.dart';
import 'package:varana_apps/pages/insight_markom_user.dart';
import 'package:varana_apps/pages/insight_sales_page.dart';
import 'package:varana_apps/pages/insight_sales_user.dart';
import 'package:varana_apps/pages/insight_semua_lead_page.dart';
import 'package:varana_apps/pages/insight_spv_user.dart';
import 'package:varana_apps/theme/thema.dart';
import 'package:varana_apps/widget/page_reminder.dart';

class OwnerInsight extends StatelessWidget {
  const OwnerInsight({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppBar header() {
      return AppBar(
        backgroundColor: kGreenColor,
        elevation: 1,
        title: Text(
          "Insight",
          style: whiteTextStyle,
        ),
      );
    }

    return Scaffold(
      appBar: header(),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(
              top: defaultMargin,
              left: defaultMargin,
              right: defaultMargin,
            ),
            child: PageReminder(
              icon: Icons.ac_unit_outlined,
              title: "Semua Lead",
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => InsightSemuaLead()));
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: defaultMargin,
              left: defaultMargin,
              right: defaultMargin,
            ),
            child: PageReminder(
              icon: Icons.ac_unit_outlined,
              title: "Lead Markom",
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => InsightMarkomUser()));
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: defaultMargin,
              left: defaultMargin,
              right: defaultMargin,
            ),
            child: PageReminder(
              icon: Icons.ac_unit_outlined,
              title: "Lead Sales",
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => InsightSalesUser()));
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: defaultMargin,
              left: defaultMargin,
              right: defaultMargin,
            ),
            child: PageReminder(
              icon: Icons.ac_unit_outlined,
              title: "Lead Spv",
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => InsightSpvUser()));
              },
            ),
          ),
        ],
      ),
    );
  }
}
