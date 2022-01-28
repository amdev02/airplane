import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:varana_apps/models/lead_model.dart';
import 'package:varana_apps/services/api.dart';
import 'package:varana_apps/theme/thema.dart';
import 'package:varana_apps/widget/button_in_loading.dart';

class MarkomEditLead extends StatefulWidget {
  final LeadModel model;
  MarkomEditLead(this.model);

  @override
  _MarkomEditLeadState createState() => _MarkomEditLeadState();
}

class _MarkomEditLeadState extends State<MarkomEditLead> {
  TextEditingController nameController = TextEditingController();
  TextEditingController noWaController = TextEditingController();
  TextEditingController alamatController = TextEditingController();
  TextEditingController sumberController = TextEditingController();
  TextEditingController keteranganController = TextEditingController();

  setup() async {
    nameController = TextEditingController(text: widget.model.nama_lengkap);
    noWaController = TextEditingController(text: widget.model.no_wa);
    alamatController = TextEditingController(text: widget.model.alamat);
    sumberSelection = widget.model.sumber;
    keteranganController = TextEditingController(text: widget.model.keterangan);
  }

  List sumber = ['Facebook', 'Instagram'];
  var sumberSelection;

  var isLoading = false;

  editLead() async {
    setState(() {
      isLoading = true;
    });
    final response = await http.post(Uri.parse(BaseUrl.editLead), body: {
      "id": widget.model.id_lead,
      "nama_lengkap": nameController.text,
      "alamat": alamatController.text,
      "no_whatsapp": noWaController.text,
      "keterangan": keteranganController.text,
      "sumber": sumberSelection,
    });
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      int value = data['value'];
      String message = data['message'];
      setState(() {
        isLoading = false;
      });
      if (value == 1) {
        print(message);
        save();
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
                        context, "/markom-page", (route) => false),
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
    setup();
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
            size: 18,
          ),
        ),
        title: Text(
          "Ubah Lead",
          style: whiteTextStyle.copyWith(
            fontSize: 16,
          ),
        ),
      );
    }

    Widget nameTextFormField() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Nama Lengkap",
            style: blackTextStyle,
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 10,
            ),
            decoration: BoxDecoration(
              color: kLightGreenColor,
              borderRadius: BorderRadius.circular(radius12),
            ),
            child: TextFormField(
              style: blackTextStyle,
              controller: nameController,
              decoration: InputDecoration(
                hintStyle: greenTextStyle,
                hintText: "Nama Lengkap",
                border: InputBorder.none,
              ),
            ),
          ),
        ],
      );
    }

    Widget noWaTextFormField() {
      return Container(
        margin: EdgeInsets.only(
          top: defaultMargin,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "No. Whatsapp",
              style: blackTextStyle,
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: 10,
              ),
              decoration: BoxDecoration(
                color: kLightGreenColor,
                borderRadius: BorderRadius.circular(radius12),
              ),
              child: TextFormField(
                style: blackTextStyle,
                controller: noWaController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintStyle: greenTextStyle,
                  hintText: "No Whatsapp",
                  border: InputBorder.none,
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget alamatTextFormField() {
      return Container(
        margin: EdgeInsets.only(
          top: defaultMargin,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Alamat",
              style: blackTextStyle,
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: 10,
              ),
              decoration: BoxDecoration(
                color: kLightGreenColor,
                borderRadius: BorderRadius.circular(radius12),
              ),
              child: TextFormField(
                style: blackTextStyle,
                controller: alamatController,
                decoration: InputDecoration(
                  hintStyle: greenTextStyle,
                  hintText: "Alamat",
                  border: InputBorder.none,
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget keteranganTextFormField() {
      return Container(
        margin: EdgeInsets.only(
          top: defaultMargin,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "keterangan",
              style: blackTextStyle,
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: 10,
              ),
              decoration: BoxDecoration(
                color: kLightGreenColor,
                borderRadius: BorderRadius.circular(radius12),
              ),
              child: TextFormField(
                style: blackTextStyle,
                controller: keteranganController,
                maxLines: 3,
                decoration: InputDecoration(
                  hintStyle: greenTextStyle,
                  hintText: "Keterangan",
                  border: InputBorder.none,
                ),
              ),
            ),
          ],
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
          items: sumber.map((value) {
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

    Widget bottomNavbar() {
      return Container(
        padding: EdgeInsets.symmetric(
          vertical: 10,
        ),
        decoration: BoxDecoration(
          color: kWhiteColor,
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              offset: Offset(0, 4),
              blurRadius: 20,
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: defaultMargin,
              ),
              width: double.infinity,
              child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: kBlueColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(radius12),
                  ),
                ),
                onPressed: () {
                  editLead();
                },
                child: isLoading
                    ? LoadingInButton()
                    : Text(
                        "Ubah",
                        style: whiteTextStyle.copyWith(
                          fontSize: 16,
                        ),
                      ),
              ),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: kWhiteColor,
      appBar: header(),
      body: Container(
        margin: EdgeInsets.all(
          defaultMargin,
        ),
        decoration: BoxDecoration(),
        child: SingleChildScrollView(
          child: Column(
            children: [
              nameTextFormField(),
              noWaTextFormField(),
              alamatTextFormField(),
              keteranganTextFormField(),
              sumberDropdown(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: bottomNavbar(),
    );
  }
}
