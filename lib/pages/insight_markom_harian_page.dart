import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:varana_apps/models/insight_models.dart';
import 'package:varana_apps/models/users_model.dart';
import 'package:varana_apps/services/api.dart';
import 'package:varana_apps/theme/thema.dart';
import 'package:varana_apps/widget/custom_loading.dart';
import 'package:varana_apps/widget/data_not_found.dart';

class InsightMarkomHarian extends StatefulWidget {
  final UserModelInsight model;
  InsightMarkomHarian(this.model);
  @override
  _InsightMarkomHarianState createState() => _InsightMarkomHarianState();
}

class _InsightMarkomHarianState extends State<InsightMarkomHarian> {
  var isLoading = false;
  var isData = false;

  List<InsightHarianUser> list = [];

  Future<void> getHarian() async {
    setState(() {
      isLoading = true;
    });
    list.clear();
    final response =
        await http.post(Uri.parse(BaseUrl.getInsightHarianMarkom), body: {
      "id_markom": widget.model.id_users,
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
            list.add(InsightHarianUser.fromJson(i));
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
    getHarian();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: getHarian,
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
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: kGreenColor,
                          borderRadius: BorderRadius.circular(radius20),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              a.hari,
                              style: whiteTextStyle,
                            ),
                            Text(
                              a.nama_user,
                              style: whiteTextStyle,
                            ),
                            Text(
                              a.jumlah_harian,
                              style: whiteTextStyle,
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
