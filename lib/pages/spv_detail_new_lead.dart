import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart' as urlLauncher;
import 'package:varana_apps/models/lead_model.dart';
import 'package:varana_apps/models/tracking_model.dart';
import 'package:varana_apps/pages/spv_add_follow_up.dart';
import 'package:varana_apps/services/api.dart';
import 'package:varana_apps/theme/thema.dart';
import 'package:varana_apps/widget/custom_loading.dart';
import 'package:varana_apps/widget/data_not_found.dart';
import 'package:varana_apps/widget/information_lead.dart';
import 'package:varana_apps/widget/information_user.dart';
import 'package:varana_apps/widget/information_users.dart';
import 'package:whatsapp_unilink/whatsapp_unilink.dart';

class SpvDetailNewLead extends StatefulWidget {
  final LeadModel model;
  SpvDetailNewLead(this.model);
  @override
  _SpvDetailNewLeadState createState() => _SpvDetailNewLeadState();
}

class _SpvDetailNewLeadState extends State<SpvDetailNewLead> {
  var isLoading = false;

  String nameSales = "";

  getSales(String idSales) async {
    setState(() {
      isLoading = true;
    });
    final response = await http.post(Uri.parse(BaseUrl.getUser), body: {
      "id": idSales,
    });
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body)[0];
      setState(() {
        isLoading = false;
        nameSales = data['nama_user'];
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

  String nameMarkom = "";

  launchWhatsApp() async {
    final link = WhatsAppUnilink(
      phoneNumber: widget.model.no_wa,
      text: " ",
    );
    // Convert the WhatsAppUnilink instance to a string.
    // Use either Dart's string interpolation or the toString() method.
    // The "launch" method is part of "url_launcher".
    await urlLauncher.launch('$link');
  }

  String keteranganWa = 'Sales Telah Menghubungi Melalui Whatsapp';

  addTrackWhatsapp() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    final response = await http.post(Uri.parse(BaseUrl.addTracking), body: {
      "id_lead": widget.model.id_lead,
      "id_user": pref.getString("idUser"),
      "keterangan": keteranganWa,
    });
    if (response.statusCode == 200) {
      getTracking();
      final data = jsonDecode(response.body);
      int value = data['value'];
      String message = data['message'];
      if (value == 1) {
        print(message);
      } else {
        print(message);
      }
    }
  }

  launchPhoneCall(String phoneNumber) {
    urlLauncher.launch('tel:$phoneNumber');
  }

  String keteranganPhone = 'Sales Telah Menelepon Customer';

  addTrackPhone() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    final response = await http.post(Uri.parse(BaseUrl.addTracking), body: {
      "id_lead": widget.model.id_lead,
      "id_user": pref.getString("idUser"),
      "keterangan": keteranganPhone,
    });
    if (response.statusCode == 200) {
      getTracking();
      final data = jsonDecode(response.body);
      int value = data['value'];
      String message = data['message'];
      if (value == 1) {
        print(message);
      } else {
        print(message);
      }
    }
  }

  getMarkom(String idMarkom) async {
    setState(() {
      isLoading = true;
    });
    final response = await http.post(Uri.parse(BaseUrl.getUser), body: {
      "id": idMarkom,
    });
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body)[0];
      setState(() {
        isLoading = false;
        nameMarkom = data['nama_user'];
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

  var isData = false;
  List<TrackingModel> list = [];

  getTracking() async {
    setState(() {
      isLoading = false;
    });
    list.clear();
    final response =
        await http.post(Uri.parse(BaseUrl.getTrackingWhere), body: {
      "id": widget.model.id_lead,
    });
    if (response.statusCode == 200) {
      if (response.contentLength == 2) {
        setState(() {
          isLoading = false;
          isData = false;
        });
      } else {
        final data = jsonDecode(response.body);
        print(data);
        setState(() {
          for (Map i in data) {
            list.add(TrackingModel.fromJson(i));
          }
          isLoading = false;
          isData = true;
        });
      }
    } else {
      setState(() {
        isLoading = false;
        isData = false;
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
    getSales(widget.model.id_sales);
    getMarkom(widget.model.id_markom);
    getTracking();
  }

  @override
  Widget build(BuildContext context) {
    AppBar header() {
      return AppBar(
        backgroundColor: kGreenColor,
        elevation: 0,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(
            Icons.arrow_back_ios,
            size: 16,
          ),
        ),
        title: Text(
          widget.model.nama_lengkap,
          style: whiteTextStyle.copyWith(
            fontSize: 16,
          ),
        ),
      );
    }

    Widget informationUser() {
      return Container(
        width: double.infinity,
        child: InformationUsers(nameSales: nameSales, nameMarkom: nameMarkom),
      );
    }

    Widget informationLead() {
      return InformationLead(
        name: widget.model.nama_lengkap,
        sumber: widget.model.sumber,
        noWa: widget.model.no_wa,
        tanggal: widget.model.tgl_add,
      );
    }

    Widget informationKeterangan() {
      return Container(
        margin: EdgeInsets.only(
          top: defaultMargin,
          left: defaultMargin,
          right: defaultMargin,
        ),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: kGreenColor,
          borderRadius: BorderRadius.circular(radius12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Keterangan",
              style: blueTextStyle,
            ),
            Divider(
              color: kBlueColor,
            ),
            Text(
              widget.model.keterangan,
              style: whiteTextStyle,
            ),
          ],
        ),
      );
    }

    Widget tracking() {
      return Container(
        child: ListView.builder(
            itemCount: list.length,
            shrinkWrap: true,
            physics: ClampingScrollPhysics(),
            itemBuilder: (context, i) {
              final a = list[i];
              return Container(
                margin: EdgeInsets.only(
                    left: defaultMargin,
                    right: defaultMargin,
                    bottom: defaultMargin),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      a.tgl,
                      style: blueTextStyle.copyWith(
                        fontSize: 12,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: kGreenColor,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        a.keterangan,
                        style: whiteTextStyle,
                      ),
                    ),
                  ],
                ),
              );
            }),
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
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SpvAddFollowUp(widget.model)));
              },
              child: Text(
                "Follow Up",
                style: whiteTextStyle,
              ),
            ),
          ),
        ),
      );
    }

    Widget button() {
      return Container(
        margin: EdgeInsets.only(
          top: defaultMargin,
          left: defaultMargin,
          right: defaultMargin,
        ),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              child: TextButton(
                onPressed: () {
                  launchWhatsApp();
                  addTrackWhatsapp();
                },
                style: TextButton.styleFrom(
                  backgroundColor: kBlueColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.message_outlined,
                      color: kWhiteColor,
                    ),
                    SizedBox(width: 8),
                    Text(
                      "Whatsapp",
                      style: whiteTextStyle,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              width: double.infinity,
              child: TextButton(
                onPressed: () {
                  launchPhoneCall(widget.model.no_wa);
                  addTrackPhone();
                },
                style: TextButton.styleFrom(
                  backgroundColor: kBlueColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.phone_outlined,
                      color: kWhiteColor,
                    ),
                    SizedBox(width: 8),
                    Text(
                      "Telepon",
                      style: whiteTextStyle,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget titleTracking() {
      return Container(
        margin: EdgeInsets.symmetric(
          vertical: defaultMargin,
        ),
        child: Center(
          child: Text(
            "Tracking",
            style: blueTextStyle.copyWith(
              fontSize: 18,
            ),
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: kGreenColor,
      appBar: header(),
      body: isLoading
          ? CustomLoading()
          : Container(
              decoration: BoxDecoration(
                color: kWhiteColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(radius20),
                  topRight: Radius.circular(radius20),
                ),
              ),
              child: ListView(
                children: [
                  informationUser(),
                  informationLead(),
                  informationKeterangan(),
                  button(),
                  titleTracking(),
                  isData ? tracking() : DataNotFound(),
                ],
              ),
            ),
      bottomNavigationBar: bottomNavbar(),
    );
  }
}
