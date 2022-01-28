import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:varana_apps/services/api.dart';
import 'package:varana_apps/theme/thema.dart';
import 'package:http/http.dart' as http;

class SpvAddListTamu extends StatefulWidget {
  const SpvAddListTamu({Key? key}) : super(key: key);

  @override
  _SpvAddListTamuState createState() => _SpvAddListTamuState();
}

class _SpvAddListTamuState extends State<SpvAddListTamu> {
  var salesSelection;
  var isLoading = false;

  TextEditingController namaController = TextEditingController(text: '');
  TextEditingController noController = TextEditingController(text: '');
  TextEditingController keteranganController = TextEditingController(text: '');

  DateTime? datePick;
  List<dynamic> listSales = [];

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

  selectedSales() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    final response = await http.post(Uri.parse(BaseUrl.getAntrianAll));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      print(data);
      setState(() {
        listSales = data;
      });
    }
  }

  handleAdd() async {
    setState(() {
      isLoading = true;
    });
    SharedPreferences pref = await SharedPreferences.getInstance();
    final response = await http.post(Uri.parse(BaseUrl.addListTamu), body: {
      "id_sales": salesSelection,
      "nama_tamu": namaController.text,
      "no_telepon": noController.text,
      "tgl_visit": datePick.toString(),
      "keterangan": keteranganController.text,
      'create_by': pref.getString("idUser"),
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

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    selectedSales();
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
          "Tambah Daftar Tamu",
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

    Widget noWaTextField() {
      return Container(
        margin: EdgeInsets.only(top: 20),
        padding: EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          color: kLightGreenColor,
          borderRadius: BorderRadius.circular(radius20),
        ),
        child: TextFormField(
          style: blackTextStyle,
          keyboardType: TextInputType.number,
          controller: noController,
          decoration: InputDecoration(
            hintText: "No. Telepon",
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

    Widget salesDropdown() {
      return Container(
        margin: EdgeInsets.only(
          top: defaultMargin,
        ),
        padding: EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          color: kLightGreenColor,
          borderRadius: BorderRadius.circular(radius20),
        ),
        child: DropdownButtonFormField(
          hint: Text(
            "Pilih Sales",
          ),
          onSaved: (e) => salesSelection,
          value: salesSelection,
          style: blackTextStyle,
          decoration: InputDecoration(
            border: InputBorder.none,
          ),
          items: listSales.map((value) {
            return DropdownMenuItem(
              child: Text(
                "${value['nama_user']}",
                style: blackTextStyle,
              ),
              value: value['id_user'],
            );
          }).toList(),
          onChanged: (newvalue) {
            setState(() {
              salesSelection = newvalue;
            });
          },
        ),
      );
    }

    Widget tanggalVisit() {
      return Container(
        margin: EdgeInsets.only(
          top: 20,
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
            handleAdd();
          },
        ),
      );
    }

    return Scaffold(
      appBar: header(),
      body: ListView(
        padding: EdgeInsets.symmetric(
          horizontal: defaultMargin,
        ),
        children: [
          nameTextField(),
          noWaTextField(),
          tanggalVisit(),
          salesDropdown(),
          keteranganTextField(),
          button(),
        ],
      ),
    );
  }
}
