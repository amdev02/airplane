import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:varana_apps/models/absen_model.dart';
import 'package:varana_apps/services/api.dart';
import 'package:varana_apps/theme/thema.dart';
import 'package:varana_apps/widget/card_absen.dart';
import 'package:varana_apps/widget/custom_loading.dart';
import 'package:varana_apps/widget/data_not_found.dart';

class MarkomAbsenTodayPage extends StatefulWidget {
  const MarkomAbsenTodayPage({Key? key}) : super(key: key);

  @override
  _MarkomAbsenTodayPageState createState() => _MarkomAbsenTodayPageState();
}

class _MarkomAbsenTodayPageState extends State<MarkomAbsenTodayPage> {
  var isLoading = false;
  var isData = false;

  List<AbsenModel> list = [];

  getAbsen() async {
    setState(() {
      isLoading = true;
    });
    SharedPreferences pref = await SharedPreferences.getInstance();
    final response = await http.post(Uri.parse(BaseUrl.tampilAbsensi));
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
            list.add(AbsenModel.fromJson(i));
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

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getAbsen();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColor,
      body: isLoading
          ? CustomLoading()
          : isData
              ? ListView.builder(
                  itemCount: list.length,
                  itemBuilder: (context, i) {
                    final a = list[i];
                    return CardAbsen(
                      name: a.nama_user,
                      status: a.status,
                      date: a.date,
                      keterangan: a.keterangan,
                      imagesAbsen: a.imagesAbsen,
                      imagesProfile: a.image,
                    );
                  },
                )
              : DataNotFound(),
    );
  }
}
