import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:varana_apps/models/sold_3_model.dart';
import 'package:varana_apps/services/api.dart';
import 'package:varana_apps/theme/thema.dart';
import 'package:varana_apps/widget/box_count_lead.dart';
import 'package:varana_apps/widget/custom_loading.dart';
import 'package:varana_apps/widget/data_not_found.dart';
import 'package:varana_apps/widget/page_title.dart';

class HmDashboard extends StatefulWidget {
  const HmDashboard({Key? key}) : super(key: key);

  @override
  _HmDashboardState createState() => _HmDashboardState();
}

class _HmDashboardState extends State<HmDashboard> {
  String name = "";

  var isLoading = false;
  var isData = false;

  getName() async {
    setState(() {
      isLoading = true;
    });
    SharedPreferences pref = await SharedPreferences.getInstance();
    final response = await http.post(Uri.parse(BaseUrl.getUser), body: {
      "id": pref.getString("idUser"),
    });
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      setState(() {
        isLoading = false;
        name = data[0]['nama_user'];
      });
      print(data);
    }

    setState(() {
      isLoading = false;
    });
  }

  String? jmlHarian;
  String? mingguan;
  String? bulanan;

  getCount() async {
    setState(() {
    isLoading = true;
    });
    SharedPreferences pref = await SharedPreferences.getInstance();
    final response = await http.post(Uri.parse(BaseUrl.countLead));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      setState(() {
        jmlHarian = data['jumlah_harian'];
        mingguan = data['jumlah_mingguan'];
        bulanan = data['jumlah_bulanan'];
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

  List<Sold3Model> list = [];

  getSold() async {
    setState(() {
      isLoading = true;
    });
    final response = await http.post(Uri.parse(BaseUrl.getSoldLimit3));
    if (response.statusCode == 200) {
      if (response.contentLength == 2) {
        ;
        setState(() {
          isLoading = false;
          isData = false;
        });
      } else {
        final data = jsonDecode(response.body);
        setState(() {
          isData = true;
          isLoading = false;
          for (Map i in data) {
            list.add(Sold3Model.fromJson(i));
          }
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
    getName();
    getCount();
    getSold();
    OneSignal.shared.setNotificationWillShowInForegroundHandler(
        (OSNotificationReceivedEvent event) {
      // Will be called whenever a notification is received in foreground
      // Display Notification, pass null param for not displaying the notification
      event.complete(event.notification);
    });

    OneSignal.shared
        .setNotificationOpenedHandler((OSNotificationOpenedResult result) {
      // Will be called whenever a notification is opened/button pressed.
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return Container(
        margin: EdgeInsets.all(defaultMargin),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Hai, " + name,
              style: blackTextStyle.copyWith(
                fontSize: 20,
                fontWeight: semiBold,
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: kLightGreenColor,
                borderRadius: BorderRadius.circular(radius12),
              ),
              child: IconButton(
                onPressed: () {},
                icon: Icon(Icons.notifications_outlined),
              ),
            ),
          ],
        ),
      );
    }

    Widget boxCountLead() {
      return Container(
        margin: EdgeInsets.only(
          left: defaultMargin,
          right: defaultMargin,
        ),
        child: BoxCountLead(
          jumlahHarian: jmlHarian == null ? "0" : jmlHarian!,
          jumlahMingguan: mingguan == null ? "0" : mingguan!,
          jumlahBulanan: bulanan == null ? "0" : bulanan!,
        ),
      );
    }

    Widget titleNewSold() {
      return Container(
        margin: EdgeInsets.only(
          top: defaultMargin,
          left: defaultMargin,
          right: defaultMargin,
        ),
        child: TitlePage(
          title: "Unit Yang Sudah Terjual",
        ),
      );
    }

    Widget boxHomeSold() {
      return isData
          ? ListView.builder(
              shrinkWrap: true,
              physics: ClampingScrollPhysics(),
              itemCount: list.length,
              itemBuilder: (context, i) {
                final a = list[i];
                return Container(
                  margin: EdgeInsets.only(
                    top: 20,
                    left: 20,
                    right: 20,
                  ),
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: kGreenColor,
                    borderRadius: BorderRadius.circular(radius20),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "No. Rumah",
                            style: whiteTextStyle,
                          ),
                          Text(
                            a.no_rumah!,
                            style: whiteTextStyle,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Type",
                            style: whiteTextStyle,
                          ),
                          Text(
                            a.tipe_rumah!,
                            style: whiteTextStyle,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Jenis Pembayaran",
                            style: whiteTextStyle,
                          ),
                          Text(
                            a.jenis_pembayaran!,
                            style: whiteTextStyle,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Unit Ini Sudah Sold Dengan Atas Nama ${a.nama_lengkap}",
                        style: whiteTextStyle,
                      ),
                    ],
                  ),
                );
              })
          : DataNotFound();
    }

    return Scaffold(
      backgroundColor: kWhiteColor,
      body: isLoading
          ? CustomLoading()
          : ListView(
              children: [
                header(),
                boxCountLead(),
                titleNewSold(),
                boxHomeSold(),
              ],
            ),
    );
  }
}
