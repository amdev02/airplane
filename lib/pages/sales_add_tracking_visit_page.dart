import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:varana_apps/models/visit_model.dart';
import 'package:varana_apps/services/api.dart';
import 'package:varana_apps/theme/thema.dart';
import 'package:varana_apps/widget/button_in_loading.dart';
import 'package:http/http.dart' as http;

class SalesAddTrackingVisit extends StatefulWidget {
  final VisitModel model;
  final VoidCallback reload;
  SalesAddTrackingVisit(this.model, this.reload);

  @override
  _SalesAddTrackingVisitState createState() => _SalesAddTrackingVisitState();
}

class _SalesAddTrackingVisitState extends State<SalesAddTrackingVisit> {
  var isLoading = false;
  TextEditingController keteranganController = TextEditingController();

  addTracking() async {
    setState(() {
      isLoading = true;
    });
    SharedPreferences pref = await SharedPreferences.getInstance();
    final response = await http.post(Uri.parse(BaseUrl.addTracking), body: {
      "id_lead": widget.model.id_lead,
      "id_user": pref.getString("idUser"),
      "keterangan": keteranganController.text,
    });
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      int value = data['value'];
      String message = data['message'];
      if (value == 1) {
        print(message);
        setState(() {
          widget.reload();
          Navigator.pop(context);
        });
      } else {
        print(message);
      }
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
          "Tambah Keterangan",
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
                addTracking();
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
      appBar: header(),
      body: Container(child: keteranganTextField()),
      bottomNavigationBar: bottomNavbar(),
    );
  }
}
