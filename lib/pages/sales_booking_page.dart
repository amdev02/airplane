import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:varana_apps/models/lead_model.dart';
import 'package:varana_apps/pages/sales_detail_booking_page.dart';
import 'package:varana_apps/services/api.dart';
import 'package:varana_apps/theme/thema.dart';
import 'package:varana_apps/widget/custom_loading.dart';
import 'package:varana_apps/widget/data_not_found.dart';
import 'package:http/http.dart' as http;

class SalesBookingPage extends StatefulWidget {
  const SalesBookingPage({Key? key}) : super(key: key);

  @override
  _SalesBookingPageState createState() => _SalesBookingPageState();
}

class _SalesBookingPageState extends State<SalesBookingPage> {
  var isLoading = false;
  var isData = false;

  List<LeadModel> list = [];

  Future<void> getBookingSales() async {
    setState(() {
      isLoading = true;
    });
    list.clear();
    SharedPreferences pref = await SharedPreferences.getInstance();
    final response = await http.post(Uri.parse(BaseUrl.getBookingSales), body: {
      "id_sales": pref.getString("idUser"),
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
            list.add(LeadModel.fromJson(i));
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

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getBookingSales();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: getBookingSales,
        child: isLoading
            ? CustomLoading()
            : isData
                ? ListView.builder(
                    itemCount: list.length,
                    itemBuilder: (context, i) {
                      final a = list[i];
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      SalesDetailBookingPage(a)));
                        },
                        child: Container(
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
                                      a.waktu,
                                      style: whiteTextStyle,
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  )
                : DataNotFound(),
      ),
    );
  }
}
