import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:varana_apps/models/lead_model.dart';
import 'package:varana_apps/pages/users/sales_page.dart';
import 'package:varana_apps/services/api.dart';
import 'package:varana_apps/theme/thema.dart';

class SalesTambahAkanVisit extends StatefulWidget {
  final LeadModel model;
  SalesTambahAkanVisit(this.model);

  @override
  _SalesTambahAkanVisitState createState() => _SalesTambahAkanVisitState();
}

class _SalesTambahAkanVisitState extends State<SalesTambahAkanVisit> {
  var isLoading = false;

  DateTime? datePick;

  void showDatePick() {
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
          datePick = value;
        });
      }
    });
  }

  TextEditingController keteranganController = TextEditingController();

  tambahVisit() async {
    setState(() {
      isLoading = true;
    });
    final response = await http.post(Uri.parse(BaseUrl.tambahVisit), body: {
      "id_lead": widget.model.id_lead,
      "nama_lengkap": widget.model.nama_lengkap,
      "alamat": widget.model.alamat,
      "no_wa": widget.model.no_wa,
      "sumber": widget.model.sumber,
      "keterangan": keteranganController.text,
      "tgl_visit": datePick.toString(),
      "id_sales": widget.model.id_sales,
      "id_markom": widget.model.id_markom,
    });
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      int value = data['value'];
      String message = data['message'];
      if (value == 1) {
        print(message);
        save();
      } else {
        print(message);
      }
    }
  }

  save() {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  "assets/success.png",
                  width: 100,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Berhasil!",
                  style: blueTextStyle.copyWith(
                    fontSize: 18,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: double.infinity,
                  child: TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: kGreenColor,
                    ),
                    onPressed: () => Navigator.pushNamedAndRemoveUntil(
                        context, "/sales-page", (route) => false),
                    child: Text(
                      "Home",
                      style: whiteTextStyle,
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }

  getNotif() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    final response = await http.post(Uri.parse(BaseUrl.notifVisit), body: {
      "id_sales": pref.getString("idUser"),
      "id_markom": widget.model.id_markom,
    });
  }

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
          "Tambah Visit",
          style: whiteTextStyle.copyWith(
            fontSize: 16,
          ),
        ),
      );
    }

    Widget keteranganTextField() {
      return Container(
        margin: EdgeInsets.all(defaultMargin),
        padding: EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          color: kGreenColor.withOpacity(0.2),
          borderRadius: BorderRadius.circular(radius20),
        ),
        child: TextFormField(
          controller: keteranganController,
          style: blackTextStyle,
          maxLines: 3,
          decoration: InputDecoration(
            hintText: "Keterangan",
            border: InputBorder.none,
          ),
        ),
      );
    }

    Widget tanggalVisit() {
      return Container(
        margin: EdgeInsets.symmetric(
          horizontal: defaultMargin,
        ),
        child: Row(
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: kLightGreenColor,
                  borderRadius: BorderRadius.circular(radius20),
                ),
                child: Text(
                  datePick == null
                      ? "Pilih Tanggal"
                      : "${DateFormat.yMMMMd().format(datePick!)}",
                  style: blackTextStyle,
                ),
              ),
            ),
            SizedBox(
              width: 12,
            ),
            Container(
              decoration: BoxDecoration(
                color: kBlueColor,
                borderRadius: BorderRadius.circular(radius12),
              ),
              child: IconButton(
                onPressed: () {
                  showDatePick();
                },
                icon: Icon(
                  Icons.calendar_today_outlined,
                  color: kWhiteColor,
                ),
              ),
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
                tambahVisit();
                getNotif();
              },
              child: Text(
                "Konfirmasi",
                style: whiteTextStyle,
              ),
            ),
          ),
        ),
      );
    }

    return Scaffold(
      appBar: header(),
      body: Column(
        children: [
          keteranganTextField(),
          tanggalVisit(),
        ],
      ),
      bottomNavigationBar: bottomNavbar(),
    );
  }
}
