import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:varana_apps/services/api.dart';
import 'package:varana_apps/theme/thema.dart';
import 'package:varana_apps/widget/button_in_loading.dart';

class MarkomReportLead extends StatefulWidget {
  @override
  _MarkomReportLeadState createState() => _MarkomReportLeadState();
}

class _MarkomReportLeadState extends State<MarkomReportLead> {
  var isLoading = false;
  DateTime? fromDate;
  DateTime? endDate;

  save() async {
    setState(() {
      isLoading = true;
    });
    SharedPreferences pref = await SharedPreferences.getInstance();
    final response = await http.post(Uri.parse(BaseUrl.reportLead), body: {
      "id_users": pref.getString("idUser"),
      "from": fromDate.toString(),
      "end": endDate.toString(),
    });
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      setState(() {
        isLoading = false;
      });
    } else {
      setState(() {
        isLoading = false;
      });
    }
    setState(() {
      isLoading = false;
    });
  }

  void fromDatePick() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
      helpText: "Pilih Tanggal Visit",
    ).then((value) {
      if (value == null) {
        return;
      } else {
        setState(() {
          fromDate = value;
        });
      }
    });
  }

  void endDatePick() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
      helpText: "Pilih Tanggal Visit",
    ).then((value) {
      if (value == null) {
        return;
      } else {
        setState(() {
          endDate = value;
        });
      }
    });
  }

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
          "Report Lead",
          style: whiteTextStyle,
        ),
      );
    }

    Widget fromDateWidget() {
      return Expanded(
        child: Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: kLightGreenColor,
            borderRadius: BorderRadius.circular(radius12),
          ),
          child: Text(fromDate == null ? "From" : "${fromDate.toString()}",
              style: blackTextStyle),
        ),
      );
    }

    Widget fromButton() {
      return Container(
        margin: EdgeInsets.only(
          left: 10,
        ),
        decoration: BoxDecoration(
          color: kBlueColor,
          borderRadius: BorderRadius.circular(radius12),
        ),
        child: IconButton(
          onPressed: () {
            fromDatePick();
          },
          icon: Icon(
            Icons.calendar_today_outlined,
            color: kWhiteColor,
          ),
        ),
      );
    }

    Widget endDateWidget() {
      return Expanded(
        child: Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: kLightGreenColor,
            borderRadius: BorderRadius.circular(radius12),
          ),
          child: Text(endDate == null ? "End" : "${endDate.toString()}",
              style: blackTextStyle),
        ),
      );
    }

    Widget endButton() {
      return Container(
        margin: EdgeInsets.only(
          left: 10,
        ),
        decoration: BoxDecoration(
          color: kBlueColor,
          borderRadius: BorderRadius.circular(radius12),
        ),
        child: IconButton(
          onPressed: () {
            endDatePick();
          },
          icon: Icon(
            Icons.calendar_today_outlined,
            color: kWhiteColor,
          ),
        ),
      );
    }

    Widget body() {
      return Container(
        margin: EdgeInsets.all(defaultMargin),
        child: Column(
          children: [
            Row(
              children: [
                fromDateWidget(),
                fromButton(),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                endDateWidget(),
                endButton(),
              ],
            ),
          ],
        ),
      );
    }

    Widget bottomNavbar() {
      return Container(
        height: 80,
        decoration: BoxDecoration(
          color: kWhiteColor,
          boxShadow: [
            BoxShadow(
              offset: Offset(0, -10),
              color: kLightGreenColor,
              blurRadius: 20,
            ),
          ],
        ),
        child: Center(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: defaultMargin),
            width: double.infinity,
            decoration: BoxDecoration(
              color: kBlueColor,
              borderRadius: BorderRadius.circular(radius20),
            ),
            child: TextButton(
              onPressed: () {
                save();
              },
              child: isLoading
                  ? LoadingInButton()
                  : Text(
                      "Konfirmasi",
                      style: whiteTextStyle,
                    ),
            ),
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: kWhiteColor,
      appBar: header(),
      body: body(),
      bottomNavigationBar: bottomNavbar(),
    );
  }
}
