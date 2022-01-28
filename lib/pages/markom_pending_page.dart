import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:varana_apps/models/lead_model.dart';
import 'package:varana_apps/services/api.dart';
import 'package:varana_apps/theme/thema.dart';
import 'package:varana_apps/widget/custom_loading.dart';
import 'package:varana_apps/widget/data_not_found.dart';
import 'package:http/http.dart' as http;

class MarkomPendingPage extends StatefulWidget {
  const MarkomPendingPage({Key? key}) : super(key: key);

  @override
  _MarkomPendingPageState createState() => _MarkomPendingPageState();
}

class _MarkomPendingPageState extends State<MarkomPendingPage> {
  var isLoading = false;
  var isData = false;

  List<LeadModel> list = [];

  Future<void> getPending() async {
    setState(() {
      isLoading = true;
    });
    list.clear();
    SharedPreferences pref = await SharedPreferences.getInstance();
    final response =
        await http.post(Uri.parse(BaseUrl.getPendingMarkom), body: {
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
          for (Map i in data) {
            list.add(LeadModel.fromJson(i));
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
  }

  deleteLead(String idLead) async {
    setState(() {
      isLoading = true;
    });
    final response = await http.post(Uri.parse(BaseUrl.deleteLead), body: {
      "id": idLead,
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

  alertHapus(String idLead, String nameLead) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Text(
            "Apakah Anda Yakin Untuk Menghapus Data ${nameLead} ?",
            style: blackTextStyle,
          ),
          actions: [
            TextButton(
              style: TextButton.styleFrom(
                backgroundColor: kBlueColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(radius12),
                ),
              ),
              onPressed: () {
                deleteLead(idLead);
              },
              child: Text(
                "Ya",
                style: whiteTextStyle,
              ),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text(
                "Tidak",
                style: blackTextStyle,
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getPending();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: getPending,
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
                        decoration: BoxDecoration(
                          color: kGreenColor,
                          borderRadius: BorderRadius.circular(radius20),
                        ),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Nama",
                                    style: whiteTextStyle,
                                  ),
                                  Text(
                                    a.nama_lengkap,
                                    style: whiteTextStyle,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 12,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "No. Whatsapp",
                                    style: whiteTextStyle,
                                  ),
                                  Text(
                                    a.no_wa,
                                    style: whiteTextStyle,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 12,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Tanggal",
                                    style: whiteTextStyle,
                                  ),
                                  Text(
                                    a.tgl_add,
                                    style: whiteTextStyle,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Align(
                              alignment: Alignment.bottomRight,
                              child: Container(
                                width: 120,
                                margin: EdgeInsets.only(
                                  right: 10,
                                ),
                                child: TextButton(
                                  style: TextButton.styleFrom(
                                    backgroundColor: kRedColor,
                                    shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(radius12),
                                    ),
                                  ),
                                  onPressed: () {
                                    alertHapus(a.id_lead, a.nama_lengkap);
                                  },
                                  child: Text(
                                    "Hapus",
                                    style: whiteTextStyle,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 12,
                            ),
                          ],
                        ),
                      );
                    })
                : DataNotFound(),
      ),
    );
  }
}
