import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:varana_apps/models/antrian_model.dart';
import 'package:varana_apps/pages/markom_add_absensi.dart';
import 'package:varana_apps/pages/markom_add_pamit_page.dart';
import 'package:varana_apps/services/api.dart';
import 'package:varana_apps/theme/thema.dart';
import 'package:varana_apps/widget/box_count_lead.dart';
import 'package:varana_apps/widget/custom_loading.dart';
import 'package:varana_apps/widget/page_title.dart';
import 'package:http/http.dart' as http;

class MarkomDashboard extends StatefulWidget {
  const MarkomDashboard({Key? key}) : super(key: key);

  @override
  _MarkomDashboardState createState() => _MarkomDashboardState();
}

class _MarkomDashboardState extends State<MarkomDashboard> {
  List<AntrianModel> listAntrian = [];

  var isLoading = false;
  var isData = false;
  String? name;

  getName() async {
    setState(() {
      isLoading = true;
    });
    SharedPreferences pref = await SharedPreferences.getInstance();
    final response = await http.post(Uri.parse(BaseUrl.getUser), body: {
      "id_users": pref.getString("idUser"),
    });
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body)[0];
      setState(() {
        isLoading = false;

        name = data['nama_user'];
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

  getAntrian() async {
    setState(() {
      isLoading = true;
    });
    SharedPreferences pref = await SharedPreferences.getInstance();
    final response = await http.post(Uri.parse(BaseUrl.antrian), body: {
      "id_markom": pref.getString("idUser"),
    });
    if (response.statusCode == 200) {
      if (response.contentLength == 2) {
        setState(() {
          isLoading = false;
          isData = false;
        });
      } else {
        final data = jsonDecode(response.body);
        setState(() {
          isLoading = false;
          isData = true;
          for (Map i in data) {
            listAntrian.add(AntrianModel.fromJson(i));
          }
        });
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

  String? jmlHarian;
  String? mingguan;
  String? bulanan;

  getCount() async {
    setState(() {
      isLoading = true;
    });
    SharedPreferences pref = await SharedPreferences.getInstance();
    final response = await http.post(Uri.parse(BaseUrl.countMarkom), body: {
      "id_markom": pref.getString("idUser"),
    });
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      setState(() {
        jmlHarian = data['jmlHarian'];
        mingguan = data['mingguan'];
        bulanan = data['bulanan'];
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

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getAntrian();
    getName();
    getCount();
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
              "Hai, $name",
              style: blackTextStyle.copyWith(
                fontSize: 18,
                fontWeight: semiBold,
              ),
            ),
            Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: kLightGreenColor,
                borderRadius: BorderRadius.circular(radius12),
              ),
              child: Icon(
                Icons.notifications_outlined,
                color: kBlueColor,
              ),
            ),
          ],
        ),
      );
    }

    Widget boxAbsen() {
      return Container(
        margin: EdgeInsets.symmetric(
          horizontal: defaultMargin,
        ),
        padding: EdgeInsets.all(defaultMargin),
        width: double.infinity,
        decoration: BoxDecoration(
          color: kGreenColor,
          borderRadius: BorderRadius.circular(radius20),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MarkomAddAbsensiPage()));
              },
              child: Container(
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: kWhiteColor,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.pan_tool_outlined,
                        size: 32,
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      "Absen",
                      style: whiteTextStyle.copyWith(
                        fontSize: 16,
                        fontWeight: medium,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MarkomAddPamitPage()));
              },
              child: Container(
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: kWhiteColor,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.redo_outlined,
                        size: 32,
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      "Pamit",
                      style: whiteTextStyle.copyWith(
                        fontSize: 16,
                        fontWeight: medium,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget boxCountLead() {
      return Container(
        margin: EdgeInsets.only(
          top: defaultMargin,
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

    Widget titleAntrian() {
      return Container(
        margin: EdgeInsets.only(
          top: defaultMargin,
          left: defaultMargin,
          right: defaultMargin,
        ),
        child: TitlePage(
          title: "Antrian Sales",
        ),
      );
    }

    Widget antrianSales() {
      return ListView.builder(
        itemCount: listAntrian.length,
        shrinkWrap: true,
        physics: ClampingScrollPhysics(),
        itemBuilder: (context, i) {
          final a = listAntrian[i];
          return Container(
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.only(
              top: defaultMargin,
              left: defaultMargin,
              right: defaultMargin,
            ),
            decoration: BoxDecoration(
              color: kGreenColor,
              borderRadius: BorderRadius.circular(radius20),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "${a.no!}",
                  style: whiteTextStyle,
                ),
                Text(
                  a.name_user!,
                  style: whiteTextStyle,
                ),
                Text(
                  a.updateDate!,
                  style: whiteTextStyle,
                ),
              ],
            ),
          );
        },
      );
    }

    return Scaffold(
      body: isLoading
          ? CustomLoading()
          : ListView(
              children: [
                header(),
                boxAbsen(),
                boxCountLead(),
                titleAntrian(),
                antrianSales(),
              ],
            ),
    );
  }
}
