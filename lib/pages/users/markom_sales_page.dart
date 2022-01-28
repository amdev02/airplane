import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:varana_apps/models/users_model.dart';
import 'package:varana_apps/pages/markom_add_sales.dart';
import 'package:varana_apps/services/api.dart';
import 'package:varana_apps/theme/thema.dart';
import 'package:varana_apps/widget/custom_loading.dart';
import 'package:varana_apps/widget/data_not_found.dart';

class MarkomSalesPage extends StatefulWidget {
  @override
  _MarkomSalesPageState createState() => _MarkomSalesPageState();
}

class _MarkomSalesPageState extends State<MarkomSalesPage> {
  var isLoading = false;
  var isData = false;

  List<UsersModel> list = [];

  getUser() async {
    setState(() {
      isLoading = true;
    });
    list.clear();
    SharedPreferences pref = await SharedPreferences.getInstance();
    print(pref.getString("idUser"));
    final response = await http.post(Uri.parse(BaseUrl.getUserByMarkom), body: {
      "id": pref.getString("idUser"),
    });
    if (response.statusCode == 200) {
      if (response.contentLength == 2) {
        setState(() {
          isData = false;
          isLoading = false;
        });
      } else {
        final data = jsonDecode(response.body);
        print(data);
        setState(() {
          isLoading = false;
          isData = true;
          for (Map i in data) {
            list.add(UsersModel.fromJson(i));
          }
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

  active(String idUser) async {
    final response = await http.post(Uri.parse(BaseUrl.activeUser), body: {
      "id": idUser,
    });
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      int value = data['value'];
      String message = data['message'];
      getUser();
      if (value == 1) {
        print(message);
      } else {
        print(message);
      }
    }
  }

  activeNow(String idUser) async {
    final response = await http.post(Uri.parse(BaseUrl.deactiveUser), body: {
      "id": idUser,
    });
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      int value = data['value'];
      getUser();
      String message = data['message'];
      if (value == 1) {
        print(message);
      } else {
        print(message);
      }
    }
  }

  deleteUser(String idUser) async {
    final response = await http.post(Uri.parse(BaseUrl.deleteUser), body: {
      "id": idUser,
    });
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      int value = data['value'];
      String message = data['message'];
      getUser();
      if (value == 1) {
        print(message);
        Navigator.pop(context);
      } else {
        print(message);
        Navigator.pop(context);
      }
    }
  }

  alertHapus(String idUser) {
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
                child: Text("Tidak", style: blueTextStyle),
              ),
              TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: kBlueColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(radius12),
                  ),
                ),
                onPressed: () {
                  deleteUser(idUser);
                },
                child: Text("Ya", style: whiteTextStyle),
              ),
            ],
          );
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
        elevation: 1,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.arrow_back_ios),
        ),
        title: Text(
          "Daftar Sales",
          style: whiteTextStyle.copyWith(
            fontSize: 16,
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: kWhiteColor,
      appBar: header(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: kBlueColor,
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => MarkomAddSalesPage(getUser)));
        },
        child: Icon(
          Icons.add,
          color: kWhiteColor,
        ),
      ),
      body: isLoading
          ? CustomLoading()
          : isData
              ? ListView.builder(
                  itemCount: list.length,
                  itemBuilder: (context, i) {
                    final a = list[i];
                    return Container(
                      margin: EdgeInsets.only(
                        left: defaultMargin,
                        right: defaultMargin,
                        top: defaultMargin,
                      ),
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: kGreenColor,
                        borderRadius: BorderRadius.circular(radius20),
                      ),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              CircleAvatar(
                                backgroundColor: kBlackColor,
                                backgroundImage:
                                    NetworkImage(BaseUrl.imageUrl + a.image),
                                radius: 40,
                              ),
                              SizedBox(
                                width: 12,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    a.nama_user,
                                    style: whiteTextStyle,
                                  ),
                                  SizedBox(
                                    height: 12,
                                  ),
                                  Text(
                                    a.username,
                                    style: whiteTextStyle,
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Text(
                                    a.createDate,
                                    style: whiteTextStyle,
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          a.active != '1'
                              ? Container(
                                  margin: EdgeInsets.symmetric(
                                    horizontal: defaultMargin,
                                  ),
                                  width: double.infinity,
                                  child: TextButton(
                                    style: TextButton.styleFrom(
                                      backgroundColor: kBlackColor,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(radius20),
                                      ),
                                    ),
                                    child: Text(
                                      "Active",
                                      style: whiteTextStyle,
                                    ),
                                    onPressed: () {
                                      active(a.id_users);
                                    },
                                  ),
                                )
                              : Container(
                                  margin: EdgeInsets.symmetric(
                                    horizontal: defaultMargin,
                                  ),
                                  width: double.infinity,
                                  child: TextButton(
                                    style: TextButton.styleFrom(
                                      backgroundColor: kRedColor,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(radius20),
                                      ),
                                    ),
                                    child: Text(
                                      "Non Active",
                                      style: whiteTextStyle,
                                    ),
                                    onPressed: () {
                                      activeNow(a.id_users);
                                    },
                                  ),
                                ),
                          Container(
                            margin: EdgeInsets.symmetric(
                              horizontal: defaultMargin,
                              vertical: 10,
                            ),
                            width: double.infinity,
                            child: TextButton(
                              style: TextButton.styleFrom(
                                backgroundColor: kBlueColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(radius20),
                                ),
                              ),
                              child: Text(
                                "Hapus",
                                style: whiteTextStyle,
                              ),
                              onPressed: () {
                                alertHapus(a.id_users);
                              },
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                )
              : DataNotFound(),
    );
  }
}
