import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:varana_apps/models/visit_model.dart';
import 'package:varana_apps/services/api.dart';
import 'package:varana_apps/theme/thema.dart';
import 'package:varana_apps/widget/button_in_loading.dart';

class SpvAddReservasiVisitPage extends StatefulWidget {
  final VisitModel model;
  SpvAddReservasiVisitPage(this.model);

  @override
  _SpvAddReservasiVisitPageState createState() =>
      _SpvAddReservasiVisitPageState();
}

class _SpvAddReservasiVisitPageState extends State<SpvAddReservasiVisitPage> {
  var rumahSelection;
  var pembayaranSelection;
  var isLoading = false;

  // ignore: deprecated_member_use
  List<dynamic> listRumah = [];
  List listPembayaran = ['KPR', 'Cash Keras', 'Cash Bertahap'];

  selectedRumah() async {
    final response = await http.get(Uri.parse(BaseUrl.selectedRumah));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      print(data);
      setState(() {
        listRumah = data;
      });
    }
  }

  TextEditingController feeController = TextEditingController();
  TextEditingController keteranganController = TextEditingController();

  tambahReservasi() async {
    setState(() {
      isLoading = true;
    });
    SharedPreferences pref = await SharedPreferences.getInstance();
    final response = await http.post(Uri.parse(BaseUrl.tambahReservasi), body: {
      "id_lead": widget.model.id_lead,
      "id_rumah": rumahSelection,
      "fee_reservasi": feeController.text,
      "jenis_pembayaran": pembayaranSelection,
      "keterangan": keteranganController.text,
      'id_user': pref.getString("idUser"),
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
    final response = await http.post(Uri.parse(BaseUrl.notifReservasi), body: {
      "id_sales": pref.getString("idUser"),
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    selectedRumah();
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
          "Tambah Reservasi",
          style: whiteTextStyle.copyWith(
            fontSize: 16,
          ),
        ),
      );
    }

    Widget rumahDropdown() {
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
            "Pilih Rumah",
          ),
          onSaved: (e) => rumahSelection,
          value: rumahSelection,
          style: blackTextStyle,
          decoration: InputDecoration(
            border: InputBorder.none,
          ),
          items: listRumah.map((value) {
            return DropdownMenuItem(
              child: Text(
                "${value['no_rumah']} - ${value['tipe_rumah']}",
                style: blackTextStyle,
              ),
              value: value['id_rumah'],
            );
          }).toList(),
          onChanged: (newvalue) {
            setState(() {
              rumahSelection = newvalue;
            });
          },
        ),
      );
    }

    Widget feeTextField() {
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
          controller: feeController,
          style: blackTextStyle,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            hintText: "Fee Reservasi",
            border: InputBorder.none,
          ),
        ),
      );
    }

    Widget jenisPembayaranDropdown() {
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
            "Pilih Jenis Pembayaran",
          ),
          onSaved: (e) => pembayaranSelection,
          value: pembayaranSelection,
          style: blackTextStyle,
          decoration: InputDecoration(
            border: InputBorder.none,
          ),
          items: listPembayaran.map((value) {
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
              pembayaranSelection = newvalue;
            });
          },
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
                  tambahReservasi();
                  getNotif();
                },
                child: isLoading
                    ? LoadingInButton()
                    : Text(
                        "Konfirmasi",
                        style: whiteTextStyle,
                      ),
              )),
        ),
      );
    }

    return Scaffold(
      appBar: header(),
      body: ListView(
        children: [
          rumahDropdown(),
          feeTextField(),
          jenisPembayaranDropdown(),
          keteranganTextField(),
        ],
      ),
      bottomNavigationBar: bottomNavbar(),
    );
  }
}
