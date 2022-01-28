import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:varana_apps/models/unit_models.dart';
import 'package:varana_apps/pages/markom_add_rumah.dart';
import 'package:varana_apps/services/api.dart';
import 'package:varana_apps/theme/thema.dart';
import 'package:varana_apps/widget/custom_loading.dart';
import 'package:varana_apps/widget/data_not_found.dart';

class UnitAvailable extends StatefulWidget {
  const UnitAvailable({Key? key}) : super(key: key);

  @override
  _UnitAvailableState createState() => _UnitAvailableState();
}

class _UnitAvailableState extends State<UnitAvailable> {
  var isLoading = false;
  var isData = false;

  List<AvailableModels> list = [];

  String? level;
  getPref() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      level = pref.getString("level");
    });
  }

  Future<void> getAvailable() async {
    setState(() {
      isLoading = false;
    });
    list.clear();
    final response = await http.post(Uri.parse(BaseUrl.getHomeByStatus), body: {
      "status": "1",
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
            list.add(AvailableModels.fromJson(i));
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

  alert() {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              content: Text(
                "Hanya Markom Yang Bisa Melakukan Tambah Rumah, Silahkan Hubungi Pihak Markom",
                style: blueTextStyle,
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    "Back",
                    style: blueTextStyle,
                  ),
                ),
              ],
            ));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getAvailable();
    getPref();
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
            color: kWhiteColor,
          ),
        ),
        title: Text(
          "Available",
          style: whiteTextStyle.copyWith(
            fontSize: 16,
          ),
        ),
      );
    }

    Widget cardUnit() {
      return Container(
        margin: EdgeInsets.only(
          top: defaultMargin,
          left: defaultMargin,
          right: defaultMargin,
        ),
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: kGreenColor,
          borderRadius: BorderRadius.circular(radius12),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "No. Rumah",
                  style: whiteTextStyle,
                ),
                Text(
                  "R1.",
                  style: whiteTextStyle,
                ),
              ],
            ),
            SizedBox(
              height: 12,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Tipe Rumah",
                  style: whiteTextStyle,
                ),
                Text(
                  "R1.",
                  style: whiteTextStyle,
                ),
              ],
            ),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: kWhiteColor,
      appBar: header(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: kBlueColor,
        onPressed: () {
          level == "2"
              ? Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => MarkomAddRumah(getAvailable)))
              : alert();
        },
        child: Icon(
          Icons.add,
          color: kWhiteColor,
        ),
      ),
      body: RefreshIndicator(
        onRefresh: getAvailable,
        child: isLoading
            ? CustomLoading()
            : isData
                ? ListView.builder(
                    itemCount: list.length,
                    itemBuilder: (context, i) {
                      final a = list[i];
                      return Container(
                        margin: EdgeInsets.only(
                          top: defaultMargin,
                          left: defaultMargin,
                          right: defaultMargin,
                        ),
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: kGreenColor,
                          borderRadius: BorderRadius.circular(radius12),
                        ),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "No. Rumah",
                                  style: whiteTextStyle,
                                ),
                                Text(
                                  a.no_rumah,
                                  style: whiteTextStyle,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 12,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Tipe Rumah",
                                  style: whiteTextStyle,
                                ),
                                Text(
                                  a.tipe_rumah,
                                  style: whiteTextStyle,
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  )
                : DataNotFound(),
      ),
    );
  }
}
