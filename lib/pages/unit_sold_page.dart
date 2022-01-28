import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:varana_apps/models/unit_models.dart';
import 'package:varana_apps/services/api.dart';
import 'package:varana_apps/theme/thema.dart';
import 'package:http/http.dart' as http;
import 'package:varana_apps/widget/custom_loading.dart';
import 'package:varana_apps/widget/data_not_found.dart';

class UnitSold extends StatefulWidget {
  const UnitSold({Key? key}) : super(key: key);

  @override
  _UnitSoldState createState() => _UnitSoldState();
}

class _UnitSoldState extends State<UnitSold> {
  var isLoading = false;
  var isData = false;
  List<AvailableModels> list = [];

  Future<void> getSold() async {
    setState(() {
      isLoading = true;
    });
    list.clear();
    final response = await http.post(Uri.parse(BaseUrl.getHomeByStatus), body: {
      "status": "4",
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
          isData = true;
          isLoading = false;
        });
      }
    } else {
      setState(() {
        isData = false;
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
    getSold();
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
          "Sold",
          style: whiteTextStyle.copyWith(fontSize: 16),
        ),
      );
    }

    return Scaffold(
      appBar: header(),
      body: RefreshIndicator(
        onRefresh: getSold,
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
