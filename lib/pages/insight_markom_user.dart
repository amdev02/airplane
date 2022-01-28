import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:varana_apps/models/users_model.dart';
import 'package:http/http.dart' as http;
import 'package:varana_apps/pages/insight_markom_page.dart';
import 'package:varana_apps/services/api.dart';
import 'package:varana_apps/theme/thema.dart';
import 'package:varana_apps/widget/custom_loading.dart';
import 'package:varana_apps/widget/data_not_found.dart';
import 'package:varana_apps/widget/page_reminder.dart';

class InsightMarkomUser extends StatefulWidget {
  const InsightMarkomUser({Key? key}) : super(key: key);

  @override
  _InsightMarkomUserState createState() => _InsightMarkomUserState();
}

class _InsightMarkomUserState extends State<InsightMarkomUser> {
  var isLoading = false;
  var isData = false;
  String level = '2';

  List<UserModelInsight> user = [];

  getUser() async {
    setState(() {
      isLoading = true;
    });
    final response = await http.post(Uri.parse(BaseUrl.getUserByLevel), body: {
      "level": level,
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
            user.add(UserModelInsight.fromJson(i));
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
    getUser();
  }

  @override
  Widget build(BuildContext context) {
    AppBar header() {
      return AppBar(
        backgroundColor: kGreenColor,
        title: Text(
          "Markom User",
          style: whiteTextStyle.copyWith(
            fontSize: 16,
          ),
        ),
        elevation: 1,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            size: 18,
          ),
        ),
      );
    }

    return Scaffold(
      appBar: header(),
      body: isLoading
          ? CustomLoading()
          : isData
              ? ListView.builder(
                  itemCount: user.length,
                  itemBuilder: (context, i) {
                    final a = user[i];
                    return Container(
                      margin: EdgeInsets.only(
                        top: defaultMargin,
                        left: defaultMargin,
                        right: defaultMargin,
                      ),
                      child: PageReminder(
                        icon: Icons.people,
                        title: a.nama_user!,
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => InsightMarkom(a)));
                        },
                      ),
                    );
                  },
                )
              : DataNotFound(),
    );
  }
}
