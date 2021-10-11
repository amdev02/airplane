import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:varana_apps/models/lead_model.dart';
import 'package:varana_apps/pages/users/sales_page.dart';
import 'package:varana_apps/services/api.dart';
import 'package:http/http.dart' as http;
import 'package:varana_apps/theme/thema.dart';

class SalesTambahFollowUp extends StatefulWidget {
  final LeadModel model;
  SalesTambahFollowUp(this.model);
  @override
  _SalesTambahFollowUpState createState() => _SalesTambahFollowUpState();
}

class _SalesTambahFollowUpState extends State<SalesTambahFollowUp> {
  var isLoading = false;

  TextEditingController keteranganController = TextEditingController();

  tambahFollowUp() async {
    setState(() {
      isLoading = true;
    });
    SharedPreferences pref = await SharedPreferences.getInstance();
    final response = await http.post(Uri.parse(BaseUrl.tambahFollowUp), body: {
      "id_lead": widget.model.id_lead,
      "tgl": widget.model.tgl_add,
      "keterangan": keteranganController.text,
      "id_user": pref.getString("idUser"),
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
    final response = await http.post(Uri.parse(BaseUrl.notifFollowUp), body: {
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
          onPressed: () {},
          icon: Icon(
            Icons.arrow_back_ios,
            size: 16,
          ),
        ),
        title: Text(
          "Hasil Follow Up",
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
                tambahFollowUp();
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
      body: Container(child: keteranganTextField()),
      bottomNavigationBar: bottomNavbar(),
    );
  }
}
