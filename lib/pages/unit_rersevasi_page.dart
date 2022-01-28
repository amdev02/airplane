import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:varana_apps/models/unit_models.dart';
import 'package:http/http.dart' as http;
import 'package:varana_apps/pages/unit_available.dart';
import 'package:varana_apps/services/api.dart';
import 'package:varana_apps/theme/thema.dart';
import 'package:varana_apps/widget/custom_loading.dart';
import 'package:varana_apps/widget/data_not_found.dart';

class UnitReservasi extends StatefulWidget {
  const UnitReservasi({Key? key}) : super(key: key);

  @override
  _UnitReservasiState createState() => _UnitReservasiState();
}

class _UnitReservasiState extends State<UnitReservasi> {
  var isLoading = false;
  var isData = false;
  List<AvailableModels> list = [];

  Future<void> getReservasi() async {
    setState(() {
      isLoading = true;
    });
    list.clear();
    final response = await http.post(Uri.parse(BaseUrl.getHomeByStatus), body: {
      "status": "2",
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
          for (Map i in data) {
            list.add(AvailableModels.fromJson(i));
          }
          isLoading = false;
          isData = true;
        });
      }
    } else {
      isLoading = false;
      isData = false;
    }
    setState(() {
      isLoading = false;
    });
  }

  handleAvailable(String idRumah) async {
    final response = await http.post(Uri.parse(BaseUrl.editHomeStatus),
        body: {"id": idRumah, "status": '1'});

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      int value = data['value'];
      String message = data['message'];
      getReservasi();
      if (value == 1) {
        print(message);
        Navigator.pop(context);
      } else {
        print(message);
        Navigator.pop(context);
      }
    } else {}
  }

  String? level;
  getPref() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      level = pref.getString("level");
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

  alertAvailable(String idRumah) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              content: Text(
                "Apakah Anda Yakin>",
                style: blueTextStyle,
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    handleAvailable(idRumah);
                  },
                  style: TextButton.styleFrom(
                      backgroundColor: kBlueColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(radius20),
                      )),
                  child: Text(
                    "Ya",
                    style: blueTextStyle,
                  ),
                ),
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
    getReservasi();
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
          icon: Icon(Icons.arrow_back_ios, color: kWhiteColor, size: 16),
        ),
        title: Text(
          "Reservasi",
          style: whiteTextStyle.copyWith(
            fontSize: 16,
          ),
        ),
      );
    }

    return Scaffold(
      appBar: header(),
      body: RefreshIndicator(
        onRefresh: getReservasi,
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
                            SizedBox(
                              height: 12,
                            ),
                            Container(
                              width: double.infinity,
                              child: TextButton(
                                onPressed: () {
                                  level == "2"
                                      ? handleAvailable(a.id_rumah)
                                      : alert();
                                },
                                style: TextButton.styleFrom(
                                    backgroundColor: kBlueColor,
                                    shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(radius20),
                                    )),
                                child: Text("Available", style: whiteTextStyle),
                              ),
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
