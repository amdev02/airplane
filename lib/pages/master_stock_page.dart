import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:varana_apps/pages/unit_available.dart';
import 'package:varana_apps/pages/unit_booking.dart';
import 'package:varana_apps/pages/unit_rersevasi_page.dart';
import 'package:varana_apps/pages/unit_sold_page.dart';
import 'package:varana_apps/services/api.dart';
import 'package:varana_apps/theme/thema.dart';
import 'package:varana_apps/widget/box_number.dart';
import 'package:varana_apps/widget/custom_loading.dart';
import 'package:varana_apps/widget/page_reminder.dart';
import 'package:varana_apps/widget/page_title.dart';
import 'package:http/http.dart' as http;

class MasterStock extends StatefulWidget {
  @override
  _MasterStockState createState() => _MasterStockState();
}

class _MasterStockState extends State<MasterStock> {
  var isLoading = false;

  String sold = "";
  String booking = "";
  String reservasi = "";
  String available = "";

  getCountUnit() async {
    setState(() {
      isLoading = true;
    });
    final response = await http.get(Uri.parse(BaseUrl.countRumah));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      print(data);
      setState(() {
        sold = data['sold'];
        booking = data['booking'];
        reservasi = data['reservasi'];
        available = data['available'];
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

  String jumlahUnit = "";
  String sisaUnit = "";
  getCountProject() async {
    setState(() {
      isLoading = false;
    });
    final response = await http.get(Uri.parse(BaseUrl.countProject));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body)[0];
      setState(() {
        isLoading = false;
        jumlahUnit = data['unit'];
        sisaUnit = data['sisa_unit'];
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

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCountUnit();
    getCountProject();
  }

  @override
  Widget build(BuildContext context) {
    AppBar header() {
      return AppBar(
        backgroundColor: kGreenColor,
        elevation: 1,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: kWhiteColor,
            size: 16,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          "Master Stock",
          style: whiteTextStyle.copyWith(
            fontSize: 16,
          ),
        ),
      );
    }

    Widget boxJumlahUnit() {
      return Container(
        margin: EdgeInsets.only(
          top: defaultMargin,
          left: defaultMargin,
          right: defaultMargin,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 150,
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: kGreenColor,
                borderRadius: BorderRadius.circular(radius12),
              ),
              child: Column(
                children: [
                  Text(
                    "Jumlah Unit",
                    style: whiteTextStyle,
                  ),
                  Text(
                    jumlahUnit,
                    style: whiteTextStyle.copyWith(
                      fontSize: 28,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: 150,
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: kGreenColor,
                borderRadius: BorderRadius.circular(radius12),
              ),
              child: Column(
                children: [
                  Text(
                    "Sisa Unit",
                    style: whiteTextStyle,
                  ),
                  Text(
                    sisaUnit,
                    style: whiteTextStyle.copyWith(
                      fontSize: 28,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }

    Widget boxUnit() {
      return Container(
        margin: EdgeInsets.all(defaultMargin),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            BoxNumber(
              title: "Available",
              number: available,
            ),
            BoxNumber(
              title: "Reservasi",
              number: reservasi,
            ),
            BoxNumber(
              title: "Booking",
              number: booking,
            ),
            BoxNumber(
              title: "Sold",
              number: sold,
            ),
          ],
        ),
      );
    }

    Widget titlePage() {
      return Container(
        margin: EdgeInsets.symmetric(
          horizontal: radius20,
        ),
        child: TitlePage(title: "Check Semua Unit"),
      );
    }

    Widget divider() {
      return Container(
        margin: EdgeInsets.symmetric(
          horizontal: radius20,
        ),
        child: Divider(
          color: kBlueColor,
        ),
      );
    }

    Widget general() {
      return Container(
        margin: EdgeInsets.only(
          top: 10,
          left: defaultMargin,
          right: defaultMargin,
        ),
        child: Column(
          children: [
            PageReminder(
              icon: Icons.library_add_outlined,
              title: "Available",
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => UnitAvailable()));
              },
            ),
            SizedBox(
              height: 15,
            ),
            PageReminder(
              icon: Icons.list,
              title: "Reservasi",
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => UnitReservasi()));
              },
            ),
            SizedBox(
              height: 15,
            ),
            PageReminder(
              icon: Icons.library_books_outlined,
              title: "Booking",
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => UnitBooking()));
              },
            ),
            SizedBox(
              height: 15,
            ),
            PageReminder(
              icon: Icons.library_add_check_outlined,
              title: "Sold",
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => UnitSold()));
              },
            ),
          ],
        ),
      );
    }

    return Scaffold(
      appBar: header(),
      body: isLoading
          ? CustomLoading()
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                boxJumlahUnit(),
                boxUnit(),
                titlePage(),
                divider(),
                general(),
              ],
            ),
    );
  }
}
