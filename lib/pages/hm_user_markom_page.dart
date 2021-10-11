import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:varana_apps/models/users_model.dart';
import 'package:http/http.dart' as http;
import 'package:varana_apps/pages/hm_user_add_markom.dart';
import 'package:varana_apps/services/api.dart';
import 'package:varana_apps/theme/thema.dart';
import 'package:varana_apps/widget/custom_loading.dart';
import 'package:varana_apps/widget/data_not_found.dart';

class HmUserMarkomPage extends StatefulWidget {
  const HmUserMarkomPage({Key? key}) : super(key: key);

  @override
  _HmUserMarkomPageState createState() => _HmUserMarkomPageState();
}

class _HmUserMarkomPageState extends State<HmUserMarkomPage> {
  var isLoading = false;
  var isData = false;

  List<UsersModel> list = [];

  getUser() async {
    setState(() {
      isLoading = true;
    });
    list.clear();
    final response = await http.get(Uri.parse(BaseUrl.getMarkom));
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

  deleteUser(String idUser) async {
    final response = await http.post(Uri.parse(BaseUrl.deleteUsers), body: {
      "id_users": idUser,
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
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: kBlueColor,
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => HmUserAddMarkom(getUser)));
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
