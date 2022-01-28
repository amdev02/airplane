import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:varana_apps/services/api.dart';
import 'package:varana_apps/theme/thema.dart';
import 'package:http/http.dart' as http;
import 'package:varana_apps/widget/button_in_loading.dart';

class MarkomAddRumah extends StatefulWidget {
  final VoidCallback reload;
  MarkomAddRumah(this.reload);
  @override
  _MarkomAddRumahState createState() => _MarkomAddRumahState();
}

class _MarkomAddRumahState extends State<MarkomAddRumah> {
  TextEditingController noRumahController = TextEditingController();
  TextEditingController tipeRumahController = TextEditingController();

  var isLoading = false;

  addRumah() async {
    setState(() {
      isLoading = true;
    });

    final response = await http.post(Uri.parse(BaseUrl.addHome), body: {
      "no_rumah": noRumahController.text,
      "tipe_rumah": tipeRumahController.text,
    });
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      int value = data['value'];
      String message = data['message'];
      if (value == 1) {
        print(message);
        Navigator.pop(context);
        setState(() {
          widget.reload();
          isLoading = false;
        });
      } else {
        setState(() {
          isLoading = false;
        });
      }
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
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.arrow_back_ios),
        ),
        title: Text(
          "Tambah Rumah",
          style: whiteTextStyle.copyWith(
            fontSize: 16,
          ),
        ),
      );
    }

    Widget noRumahTextField() {
      return Container(
        margin:
            EdgeInsets.only(top: 30, left: defaultMargin, right: defaultMargin),
        padding: EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          color: kGreenColor.withOpacity(0.2),
          borderRadius: BorderRadius.circular(radius20),
        ),
        child: TextFormField(
          style: blackTextStyle,
          controller: noRumahController,
          decoration: InputDecoration(
            hintText: "No. Rumah",
            border: InputBorder.none,
          ),
        ),
      );
    }

    Widget tipeRumahTextField() {
      return Container(
        margin:
            EdgeInsets.only(top: 30, left: defaultMargin, right: defaultMargin),
        padding: EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          color: kGreenColor.withOpacity(0.2),
          borderRadius: BorderRadius.circular(radius20),
        ),
        child: TextFormField(
          style: blackTextStyle,
          controller: tipeRumahController,
          decoration: InputDecoration(
            hintText: "Tipe Rumah",
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
                addRumah();
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
      body: ListView(
        children: [
          noRumahTextField(),
          tipeRumahTextField(),
        ],
      ),
      bottomNavigationBar: bottomNavbar(),
    );
  }
}
