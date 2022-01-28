import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:varana_apps/services/api.dart';
import 'package:varana_apps/theme/thema.dart';

class AddLeadPage extends StatefulWidget {
  @override
  _AddLeadPageState createState() => _AddLeadPageState();
}

class _AddLeadPageState extends State<AddLeadPage> {
  var sumberSelection;

  List listSumber = ['Facebook', "Instagram"];
  String idSales = "";

  getSales() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    final response = await http.post(Uri.parse(BaseUrl.getAntrianAll));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      setState(() {
        idSales = data[0]['id_user'];
      });
      print(idSales);
    }
  }

  Future<void> getNotif() async {
    final response = await http.post(Uri.parse(BaseUrl.notifLead), body: {
      "id": idSales,
    });
  }

  TextEditingController namaController = TextEditingController();
  TextEditingController alamatController = TextEditingController();
  TextEditingController noTelpController = TextEditingController();
  TextEditingController keteranganController = TextEditingController();
  String sumber = "";

  addNewLead() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    final response = await http.post(Uri.parse(BaseUrl.addLead), body: {
      "nama_lengkap": namaController.text,
      "no_whatsapp": noTelpController.text,
      "alamat": alamatController.text,
      "keterangan": keteranganController.text,
      "sumber": sumberSelection,
      "id_sales": idSales,
      "id_markom": pref.getString("idUser"),
    });
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      int value = data['value'];
      String message = data['message'];
      if (value == 1) {
        print(message);
        print("Sumber $sumberSelection");
        Navigator.pop(context);
      } else {
        print(message);
        print(sumber);
      }
    }
  }

  final _form = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getSales();
  }

  @override
  Widget build(BuildContext context) {
    AppBar header() {
      return AppBar(
        backgroundColor: kGreenColor,
        elevation: 1,
        leading: Icon(
          Icons.arrow_back_ios,
          size: 16,
        ),
        title: Text(
          "Tambah Lead",
          style: whiteTextStyle.copyWith(
            fontSize: 16,
          ),
        ),
      );
    }

    Widget nameTextField() {
      return Container(
        margin: EdgeInsets.only(top: 30),
        padding: EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          color: kLightGreenColor,
          borderRadius: BorderRadius.circular(radius20),
        ),
        child: TextFormField(
          style: blackTextStyle,
          controller: namaController,
          decoration: InputDecoration(
            hintText: "Nama Lengkap",
            border: InputBorder.none,
          ),
        ),
      );
    }

    Widget noTelpTextField() {
      return Container(
        margin: EdgeInsets.only(top: defaultMargin),
        padding: EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          color: kLightGreenColor,
          borderRadius: BorderRadius.circular(radius20),
        ),
        child: TextFormField(
          keyboardType: TextInputType.number,
          style: blackTextStyle,
          controller: noTelpController,
          decoration: InputDecoration(
            hintText: "No. Telepon",
            border: InputBorder.none,
          ),
        ),
      );
    }

    Widget alamatTextField() {
      return Container(
        margin: EdgeInsets.only(top: defaultMargin),
        padding: EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          color: kLightGreenColor,
          borderRadius: BorderRadius.circular(radius20),
        ),
        child: TextFormField(
          style: blackTextStyle,
          controller: alamatController,
          decoration: InputDecoration(
            hintText: "Alamat",
            border: InputBorder.none,
          ),
        ),
      );
    }

    Widget keteranganTextField() {
      return Container(
        margin: EdgeInsets.only(top: defaultMargin),
        padding: EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          color: kLightGreenColor,
          borderRadius: BorderRadius.circular(radius20),
        ),
        child: TextFormField(
          maxLines: 3,
          style: blackTextStyle,
          controller: keteranganController,
          decoration: InputDecoration(
            hintText: "Keterangan",
            border: InputBorder.none,
          ),
        ),
      );
    }

    Widget sumberDropdown() {
      return Container(
        margin: EdgeInsets.only(top: defaultMargin),
        padding: EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          color: kLightGreenColor,
          borderRadius: BorderRadius.circular(radius20),
        ),
        child: DropdownButtonFormField(
          hint: Text(
            "Pilih Sumber",
          ),
          onSaved: (e) => sumberSelection,
          value: sumberSelection,
          style: blackTextStyle,
          decoration: InputDecoration(
            border: InputBorder.none,
          ),
          items: listSumber.map((value) {
            return DropdownMenuItem(
              child: Text(
                value,
                style: blackTextStyle,
              ),
              value: value,
            );
          }).toList(),
          onChanged: (newvalue) {
            setState(() {
              sumberSelection = newvalue;
            });
          },
        ),
      );
    }

    Widget button() {
      return Container(
        margin: EdgeInsets.only(
          top: defaultMargin,
        ),
        child: TextButton(
          child: Text(
            "Simpan",
            style: whiteTextStyle,
          ),
          style: TextButton.styleFrom(
            backgroundColor: kBlueColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(radius20),
            ),
          ),
          onPressed: () {
            if (_form.currentState!.validate()) {
              _form.currentState!.save();
              addNewLead();
            }
            getNotif();
          },
        ),
      );
    }

    return Scaffold(
      backgroundColor: kGreenColor,
      appBar: header(),
      body: Container(
        padding: EdgeInsets.symmetric(
          horizontal: defaultMargin,
        ),
        decoration: BoxDecoration(
          color: kWhiteColor,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(radius20),
          ),
        ),
        child: Form(
          key: _form,
          child: ListView(
            children: [
              nameTextField(),
              alamatTextField(),
              noTelpTextField(),
              keteranganTextField(),
              sumberDropdown(),
              button(),
            ],
          ),
        ),
      ),
    );
  }
}
