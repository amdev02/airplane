import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:varana_apps/models/lead_model.dart';
import 'package:varana_apps/services/api.dart';
import 'package:varana_apps/theme/thema.dart';
import 'package:varana_apps/widget/button_in_loading.dart';

class SpvAddSoldPage extends StatefulWidget {
  final LeadModel model;
  SpvAddSoldPage(this.model);

  @override
  _SpvAddSoldPageState createState() => _SpvAddSoldPageState();
}

class _SpvAddSoldPageState extends State<SpvAddSoldPage> {
  var isLoading = false;
  var bankSelection;

  TextEditingController keteranganController = TextEditingController();

  List<dynamic> listBank = [];

  getBank() async {
    setState(() {
      isLoading = true;
    });
    final response = await http.post(Uri.parse(BaseUrl.selectedBank));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      setState(() {
        listBank = data;
      });
    }
    setState(() {
      isLoading = false;
    });
  }

  tambahSold() async {
    setState(() {
      isLoading = true;
    });
    SharedPreferences pref = await SharedPreferences.getInstance();
    final response = await http.post(Uri.parse(BaseUrl.tambahSold), body: {
      "id_lead": widget.model.id_lead,
      "id_bank": bankSelection,
      "keterangan": keteranganController.text,
      "id_user": pref.getString("idUser"),
    });
    if (response.statusCode == 200) {
      save();
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
                        context, "/spv-page", (route) => false),
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
    final response = await http.post(Uri.parse(BaseUrl.notifSold), body: {
      "id_sales": pref.getString("idUser"),
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getBank();
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
          "Tambah Sold",
          style: whiteTextStyle.copyWith(
            fontSize: 16,
          ),
        ),
      );
    }

    Widget keteranganTextField() {
      return Container(
        margin: EdgeInsets.only(
          top: defaultMargin,
          left: defaultMargin,
          right: defaultMargin,
        ),
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

    Widget bankDropdown() {
      return Container(
        margin: EdgeInsets.only(
          top: defaultMargin,
          left: defaultMargin,
          right: defaultMargin,
        ),
        padding: EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          color: kLightGreenColor,
          borderRadius: BorderRadius.circular(radius20),
        ),
        child: DropdownButtonFormField(
          hint: Text(
            "Pilih Bank",
          ),
          onSaved: (e) => bankSelection,
          value: bankSelection,
          style: blackTextStyle,
          decoration: InputDecoration(
            border: InputBorder.none,
          ),
          items: listBank.map((value) {
            return DropdownMenuItem(
              child: Text(
                value['nama_bank'],
                style: blackTextStyle,
              ),
              value: value['id_bank'],
            );
          }).toList(),
          onChanged: (newvalue) {
            setState(() {
              bankSelection = newvalue;
            });
          },
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
                tambahSold();
                getNotif();
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
      body: ListView(
        children: [
          bankDropdown(),
          keteranganTextField(),
        ],
      ),
      bottomNavigationBar: bottomNavbar(),
    );
  }
}
