import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:varana_apps/models/tamu_model.dart';
import 'package:varana_apps/services/api.dart';
import 'package:varana_apps/theme/thema.dart';
import 'package:http/http.dart' as http;
import 'package:varana_apps/widget/custom_loading.dart';
import 'package:varana_apps/widget/data_not_found.dart';

class SpvListTamu extends StatefulWidget {
  const SpvListTamu({Key? key}) : super(key: key);

  @override
  _SpvListTamuState createState() => _SpvListTamuState();
}

class _SpvListTamuState extends State<SpvListTamu> {
  var isLoading = false;
  var isData = false;

  List<TamuModel> list = [];

  Future<void> getTamu() async {
    setState(() {
      isLoading = true;
    });
    list.clear();
    SharedPreferences pref = await SharedPreferences.getInstance();
    final response =
        await http.post(Uri.parse(BaseUrl.getListTamuByCreate), body: {
      'id': pref.getString("idUser"),
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
            list.add(TamuModel.fromJson(i));
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

  delete(String id) async {
    final response = await http.post(Uri.parse(BaseUrl.deleteListTamu), body: {
      "id": id,
    });
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      int value = data['value'];
      String message = data['message'];
      getTamu();
      if (value == 1) {
        print(message);
        Navigator.pop(context);
      } else {
        print(message);
        Navigator.pop(context);
      }
    }
  }

  alertHapus(String id) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            "Apakah Anda Yakin?",
            style: blueTextStyle,
          ),
          actions: [
            MaterialButton(
              onPressed: () => Navigator.pop(context),
              child: Text(
                "Tidak",
                style: blueTextStyle,
              ),
            ),
            TextButton(
              style: TextButton.styleFrom(
                  backgroundColor: kBlueColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(radius12),
                  )),
              onPressed: () => delete(id),
              child: Text(
                "Ya",
                style: whiteTextStyle,
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
    getTamu();
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
          "Daftar Tamu",
          style: whiteTextStyle.copyWith(
            fontSize: 16,
          ),
        ),
      );
    }

    return Scaffold(
      appBar: header(),
      body: RefreshIndicator(
        onRefresh: getTamu,
        child: isLoading
            ? CustomLoading()
            : isData
                ? ListView.builder(
                    itemCount: list.length,
                    itemBuilder: (context, i) {
                      final a = list[i];
                      return Container(
                        margin: EdgeInsets.only(
                          left: defaultMargin,
                          top: defaultMargin,
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
                              padding: EdgeInsets.symmetric(
                                horizontal: 10,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Tanggal Visit",
                                    style: whiteTextStyle,
                                  ),
                                  Text(
                                    a.tgl_visit,
                                    style: whiteTextStyle,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 12,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 10,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Nama Sales",
                                    style: whiteTextStyle,
                                  ),
                                  Text(
                                    a.nama_sales,
                                    style: whiteTextStyle,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 12,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 10,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Nama Konsumen",
                                    style: whiteTextStyle,
                                  ),
                                  Text(
                                    a.nama_tamu,
                                    style: whiteTextStyle,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 12,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 10,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "No. Hp",
                                    style: whiteTextStyle,
                                  ),
                                  Text(
                                    a.no_telepon,
                                    style: whiteTextStyle,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 12,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 10,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Keterangan",
                                    style: whiteTextStyle,
                                  ),
                                  Text(
                                    a.keterangan,
                                    style: whiteTextStyle,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(
                                vertical: 15,
                                horizontal: 10,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Container(
                                    height: 40,
                                    width: 120,
                                    decoration: BoxDecoration(
                                      color: kRedColor,
                                      borderRadius:
                                          BorderRadius.circular(radius20),
                                    ),
                                    child: TextButton(
                                      onPressed: () {
                                        alertHapus(a.id_list_tamu);
                                      },
                                      child: Text(
                                        "Hapus",
                                        style: whiteTextStyle,
                                      ),
                                    ),
                                  ),
                                ],
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
