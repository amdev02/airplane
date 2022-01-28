import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:varana_apps/models/lead_model.dart';
import 'package:varana_apps/models/tracking_model.dart';
import 'package:varana_apps/pages/markom_edit_lead_page.dart';
import 'package:varana_apps/services/api.dart';
import 'package:varana_apps/theme/thema.dart';
import 'package:varana_apps/widget/button_in_loading.dart';
import 'package:varana_apps/widget/custom_loading.dart';
import 'package:varana_apps/widget/data_not_found.dart';
import 'package:varana_apps/widget/information_lead.dart';
import 'package:varana_apps/widget/information_user.dart';
import 'package:varana_apps/widget/information_users.dart';

class MarkomDetailNewLeadPage extends StatefulWidget {
  final LeadModel model;
  MarkomDetailNewLeadPage(this.model);
  @override
  _MarkomDetailNewLeadPageState createState() =>
      _MarkomDetailNewLeadPageState();
}

class _MarkomDetailNewLeadPageState extends State<MarkomDetailNewLeadPage> {
  var isLoading = false;

  String nameSales = "";
  String imagesSales = "";

  getSales() async {
    setState(() {
      isLoading = true;
    });
    final response = await http.post(Uri.parse(BaseUrl.getUser), body: {
      "id": widget.model.id_sales,
    });
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      setState(() {
        isLoading = false;
        nameSales = data[0]['nama_user'];
        imagesSales = data[0]['images'];
      });
      print("id Sales : $data");
    } else {
      setState(() {
        isLoading = false;
      });
    }
    setState(() {
      isLoading = false;
    });
  }

  String nameMarkom = "";
  String imagesMarkom = "";

  getMarkom() async {
    setState(() {
      isLoading = true;
    });
    final response = await http.post(Uri.parse(BaseUrl.getUser), body: {
      "id": widget.model.id_markom,
    });
    if (response.statusCode == 200) {
      if (response.contentLength == 2) {
        isLoading = true;
      } else {
        final data = jsonDecode(response.body)[0];
        setState(() {
          isLoading = false;
          nameMarkom = data['nama_user'];
          imagesMarkom = data['images'];
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

  var isData = false;
  List<TrackingModel> list = [];

  getTracking() async {
    setState(() {
      isLoading = false;
    });
    list.clear();
    final response =
        await http.post(Uri.parse(BaseUrl.getTrackingWhere), body: {
      "id": widget.model.id_lead,
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
            list.add(TrackingModel.fromJson(i));
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

  deleteLead() async {
    setState(() {
      isLoading = true;
    });
    final response = await http.post(Uri.parse(BaseUrl.deleteLead), body: {
      "id": widget.model.id_lead,
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

  alertHapus() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Text(
            "Apakah Anda Yakin Untuk Menghapus Data ${widget.model.nama_lengkap} ?",
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
                deleteLead();
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
    getSales();
    getMarkom();
    getTracking();
  }

  @override
  Widget build(BuildContext context) {
    AppBar header() {
      return AppBar(
        backgroundColor: kGreenColor,
        elevation: 0,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(
            Icons.arrow_back_ios,
            size: 16,
          ),
        ),
        title: Text(
          widget.model.nama_lengkap,
          style: whiteTextStyle.copyWith(
            fontSize: 16,
          ),
        ),
      );
    }

    Widget informationSales() {
      return InformationUser(
        imageUrl: BaseUrl.imageUrl + imagesSales,
        name: nameSales,
      );
    }

    Widget informationMarkom() {
      return InformationUser(
        imageUrl: BaseUrl.imageUrl + imagesMarkom,
        name: nameMarkom,
      );
    }

    Widget informationLead() {
      return InformationLead(
        name: widget.model.nama_lengkap,
        sumber: widget.model.sumber,
        noWa: widget.model.no_wa,
        tanggal: widget.model.tgl_add,
      );
    }

    Widget informationKeterangan() {
      return Container(
        margin: EdgeInsets.only(
          top: defaultMargin,
          left: defaultMargin,
          right: defaultMargin,
        ),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: kGreenColor,
          borderRadius: BorderRadius.circular(radius12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Keterangan",
              style: blueTextStyle,
            ),
            Divider(
              color: kBlueColor,
            ),
            Text(
              widget.model.keterangan,
              style: whiteTextStyle,
            ),
          ],
        ),
      );
    }

    Widget tracking() {
      return Container(
        child: ListView.builder(
            itemCount: list.length,
            shrinkWrap: true,
            physics: ClampingScrollPhysics(),
            itemBuilder: (context, i) {
              final a = list[i];
              return Container(
                margin: EdgeInsets.only(
                    left: defaultMargin,
                    right: defaultMargin,
                    bottom: defaultMargin),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      a.tgl,
                      style: blueTextStyle.copyWith(
                        fontSize: 12,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: kGreenColor,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            a.nama_user,
                            style: blueTextStyle,
                          ),
                          Divider(
                            color: kBlueColor,
                          ),
                          Text(
                            a.keterangan,
                            style: whiteTextStyle,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }),
      );
    }

    Widget titleTracking() {
      return Container(
        margin: EdgeInsets.symmetric(
          vertical: defaultMargin,
        ),
        child: Center(
          child: Text(
            "Tracking",
            style: blueTextStyle.copyWith(
              fontSize: 18,
            ),
          ),
        ),
      );
    }

    Widget bottomNavBar() {
      return Container(
        padding: EdgeInsets.symmetric(
          horizontal: defaultMargin,
          vertical: 10,
        ),
        decoration: BoxDecoration(
          color: kWhiteColor,
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 26,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              child: TextButton(
                onPressed: () {
                  alertHapus();
                },
                style: TextButton.styleFrom(
                  backgroundColor: kRedColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(radius12),
                  ),
                ),
                child: isLoading
                    ? LoadingInButton()
                    : Row(
                        children: [
                          Icon(
                            Icons.delete,
                            color: kWhiteColor,
                          ),
                          SizedBox(
                            width: 4,
                          ),
                          Text(
                            "Hapus",
                            style: whiteTextStyle.copyWith(
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
              ),
            ),
            Container(
              child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: kBlueColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(radius12),
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MarkomEditLead(widget.model)));
                },
                child: Row(
                  children: [
                    Icon(
                      Icons.edit,
                      color: kWhiteColor,
                    ),
                    SizedBox(
                      width: 4,
                    ),
                    Text(
                      "Ubah",
                      style: whiteTextStyle.copyWith(
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget informationUser() {
      return InformationUsers(nameSales: nameSales, nameMarkom: nameMarkom);
    }

    return Scaffold(
      backgroundColor: kGreenColor,
      appBar: header(),
      body: isLoading
          ? CustomLoading()
          : Container(
              decoration: BoxDecoration(
                color: kWhiteColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(radius20),
                  topRight: Radius.circular(radius20),
                ),
              ),
              child: ListView(
                children: [
                  // informationSales(),
                  // informationMarkom(),
                  informationUser(),
                  informationLead(),
                  informationKeterangan(),
                  titleTracking(),
                  isData ? tracking() : DataNotFound(),
                ],
              ),
            ),
      bottomNavigationBar: bottomNavBar(),
    );
  }
}
