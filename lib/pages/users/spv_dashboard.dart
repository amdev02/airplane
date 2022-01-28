import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:varana_apps/models/antrian_model.dart';
import 'package:varana_apps/pages/spv_add_absen_page.dart';
import 'package:varana_apps/pages/spv_add_list_tamu.dart';
import 'package:varana_apps/pages/spv_add_pamit_page.dart';
import 'package:varana_apps/services/api.dart';
import 'package:varana_apps/theme/thema.dart';
import 'package:http/http.dart' as http;
import 'package:varana_apps/widget/box_count_lead.dart';
import 'package:varana_apps/widget/page_title.dart';

class SpvDashboard extends StatefulWidget {
  const SpvDashboard({Key? key}) : super(key: key);

  @override
  _SpvDashboardState createState() => _SpvDashboardState();
}

class _SpvDashboardState extends State<SpvDashboard> {
  String name = "";

  var isLoading = false;

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
    final response = await http.post(Uri.parse(BaseUrl.countSales), body: {
      "id": pref.getString("idUser"),
    });
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

  List<AntrianModel> listAntrian = [];
  var isData = false;

  getAntrian() async {
    setState(() {
      isLoading = true;
    });
    SharedPreferences pref = await SharedPreferences.getInstance();
    final response = await http.post(Uri.parse(BaseUrl.getAntrianAll));
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

  setToken() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    final status = await OneSignal.shared.getDeviceState();
    final response = await http.post(Uri.parse(BaseUrl.changeToken), body: {
      "id": pref.getString("idUser"),
      "token": status?.userId,
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getName();
    getCount();
    getAntrian();
    setToken();
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
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SpvAddAbsen()));
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
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SpvAddPamitPage()));
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

    Widget addListTamu() {
      return GestureDetector(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => SpvAddListTamu()));
        },
        child: Container(
          margin: EdgeInsets.only(
            left: defaultMargin,
            right: defaultMargin,
            top: defaultMargin,
          ),
          padding: EdgeInsets.all(defaultMargin),
          decoration: BoxDecoration(
            color: kGreenColor,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              Icon(
                Icons.add,
                color: kWhiteColor,
                size: 18,
              ),
              Text(
                'Tambah Daftar Tamu',
                style: whiteTextStyle,
              ),
            ],
          ),
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
          jumlahHarian: jmlHarian != null ? jmlHarian! : "0",
          jumlahMingguan: mingguan != null ? mingguan! : "0",
          jumlahBulanan: bulanan != null ? bulanan! : "0",
        ),
      );
    }

    Widget titleNewLead() {
      return Container(
        margin: EdgeInsets.only(
          top: defaultMargin,
          left: defaultMargin,
          right: defaultMargin,
        ),
        child: TitlePage(
          title: "Lead Baru Untuk Anda",
        ),
      );
    }

    Widget boxNewLead() {
      return Container(
        margin: EdgeInsets.all(20),
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: kGreenColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Nama",
                  style: whiteTextStyle,
                ),
                Text(
                  "Raisya Anggures",
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
                  "No. Telp",
                  style: whiteTextStyle,
                ),
                Text(
                  "62890129838",
                  style: whiteTextStyle,
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Lead Masuk Pada Tanggal 20 November 2021",
              style: whiteTextStyle,
            ),
          ],
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
          title: "Unit Yang Sudah Anda Jual",
        ),
      );
    }

    Widget boxHomeSold() {
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
                  "Nama",
                  style: whiteTextStyle,
                ),
                Text(
                  "R1",
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
                  "10/10",
                  style: whiteTextStyle,
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Unit Ini Sudah Sold Dengan Atas Nama Wicaksono",
              style: whiteTextStyle,
            ),
          ],
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
      backgroundColor: kWhiteColor,
      body: ListView(
        children: [
          header(),
          boxAbsen(),
          boxCountLead(),
          addListTamu(),
          // titleNewLead(),
          // boxNewLead(),
          // titleNewSold(),
          // boxHomeSold(),
          titleAntrian(),
          antrianSales(),
        ],
      ),
    );
  }
}
