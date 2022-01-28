import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:varana_apps/models/lead_model.dart';
import 'package:varana_apps/models/tracking_model.dart';
import 'package:varana_apps/pages/spv_add_sold_page.dart';
import 'package:varana_apps/services/api.dart';
import 'package:varana_apps/theme/thema.dart';
import 'package:varana_apps/widget/custom_loading.dart';
import 'package:varana_apps/widget/data_not_found.dart';
import 'package:varana_apps/widget/information_lead.dart';
import 'package:varana_apps/widget/information_user.dart';
import 'package:varana_apps/widget/information_users.dart';

class SpvDetailBooking extends StatefulWidget {
  final LeadModel model;
  SpvDetailBooking(this.model);

  @override
  _SpvDetailBookingState createState() => _SpvDetailBookingState();
}

class _SpvDetailBookingState extends State<SpvDetailBooking> {
  var isLoading = false;

  String nameSales = "";

  getSales(String idSales) async {
    setState(() {
      isLoading = true;
    });
    final response = await http.post(Uri.parse(BaseUrl.getUser), body: {
      "id": idSales,
    });
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body)[0];
      setState(() {
        isLoading = false;
        nameSales = data['nama_user'];
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

  String nameMarkom = "";

  getMarkom(String idMarkom) async {
    setState(() {
      isLoading = true;
    });
    final response = await http.post(Uri.parse(BaseUrl.getUser), body: {
      "id": idMarkom,
    });
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body)[0];
      setState(() {
        isLoading = false;
        nameMarkom = data['nama_user'];
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

  int feeReservasi = 0;
  int feeBooking = 0;
  int total = 0;
  getFeeDetail(String idLead) async {
    setState(() {
      isLoading = true;
    });
    final response = await http.post(Uri.parse(BaseUrl.getFee), body: {
      "id": idLead,
    });
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body)[0];
      setState(() {
        isLoading = false;
        feeReservasi = data['fee_reservasi'];
        feeBooking = data['fee_booking'];
        total = data['total'];
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

  int subtotal = 0;
  int diskon = 0;
  int dp = 0;
  int diskonDp = 0;
  int dpDibayar = 0;

  getPembayaranDetail(String idLead) async {
    setState(() {
      isLoading = true;
    });
    final response = await http.post(Uri.parse(BaseUrl.getPayment), body: {
      "id": idLead,
    });
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body)[0];
      setState(() {
        isLoading = false;
        subtotal = data['subtotal'];
        dp = data['dp'];
        diskon = data['diskon_harga'];
        diskonDp = data['diskon_dp'];
        dpDibayar = data['dp_dibayar'];
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

  final price = NumberFormat("#,##0", "en_us");
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

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getSales(widget.model.id_sales);
    getMarkom(widget.model.id_markom);
    getFeeDetail(widget.model.id_lead);
    getPembayaranDetail(widget.model.id_lead);
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

    Widget informationUser() {
      return Container(
        width: double.infinity,
        child: InformationUsers(
          nameSales: nameSales,
          nameMarkom: nameMarkom,
        ),
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

    Widget informationFee() {
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
              "Information Fee",
              style: blueTextStyle,
            ),
            Divider(
              color: kBlueColor,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Fee Reservasi",
                  style: whiteTextStyle,
                ),
                Text(
                  "Rp. ${price.format(feeReservasi)}",
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
                  "Fee Booking",
                  style: whiteTextStyle,
                ),
                Text(
                  "Rp. ${price.format(feeBooking)}",
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
                  "Total",
                  style: whiteTextStyle,
                ),
                Text(
                  "Rp. ${price.format(total)}",
                  style: whiteTextStyle,
                ),
              ],
            ),
          ],
        ),
      );
    }

    Widget informationPembayaran() {
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
              "Information Pembayaran",
              style: blueTextStyle,
            ),
            Divider(
              color: kBlueColor,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Harga",
                  style: whiteTextStyle,
                ),
                Text(
                  "Rp. ${price.format(int.parse(widget.model.harga!))}",
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
                  "Diskon Harga",
                  style: whiteTextStyle,
                ),
                Text(
                  diskon != null ? "Rp. ${price.format(diskon)}" : "Rp. 0",
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
                  "Downpayment",
                  style: whiteTextStyle,
                ),
                Text(
                  dp != null ? "Rp. ${price.format(dp)}" : "Rp. 0",
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
                  "Diskon Dp",
                  style: whiteTextStyle,
                ),
                Text(
                  diskonDp != null ? "Rp. ${price.format(diskonDp)}" : "Rp. 0",
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
                  "Dp Dibayar",
                  style: whiteTextStyle,
                ),
                Text(
                  diskonDp != null ? "Rp. ${price.format(dpDibayar)}" : "Rp. 0",
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
                  "Subtotal",
                  style: whiteTextStyle,
                ),
                Text(
                  subtotal != null ? "Rp. ${price.format(subtotal)}" : "Rp. 0",
                  style: whiteTextStyle,
                ),
              ],
            ),
          ],
        ),
      );
    }

    Widget informationRumah() {
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
              "Information Rumah",
              style: blueTextStyle,
            ),
            Divider(
              color: kBlueColor,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "No. Rumah",
                  style: whiteTextStyle,
                ),
                Text(
                  widget.model.no_rumah!,
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
                  widget.model.tipe_rumah!,
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
                  "Jenis Pembayaran",
                  style: whiteTextStyle,
                ),
                Text(
                  widget.model.jenis_pembayaran,
                  style: whiteTextStyle,
                ),
              ],
            ),
          ],
        ),
      );
    }

    Widget bottomNavbar() {
      return Container(
        height: 80,
        decoration: BoxDecoration(
          color: kWhiteColor,
          boxShadow: [
            BoxShadow(
              offset: Offset(0, -10),
              color: kLightGreenColor,
              blurRadius: 20,
            ),
          ],
        ),
        child: Center(
          child: Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: defaultMargin),
            decoration: BoxDecoration(
              color: kBlueColor,
              borderRadius: BorderRadius.circular(radius20),
            ),
            child: TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SpvAddSoldPage(widget.model)));
              },
              child: Text(
                "Sold",
                style: whiteTextStyle,
              ),
            ),
          ),
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
                      child: Text(
                        a.keterangan,
                        style: whiteTextStyle,
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

    return Scaffold(
      backgroundColor: kGreenColor,
      appBar: header(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: kBlueColor,
        child: Icon(
          Icons.add,
          color: kWhiteColor,
        ),
      ),
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
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    informationUser(),
                    informationLead(),
                    informationKeterangan(),
                    informationFee(),
                    informationRumah(),
                    informationPembayaran(),
                    titleTracking(),
                    isData ? tracking() : DataNotFound(),
                    SizedBox(
                      height: 12,
                    ),
                  ],
                ),
              ),
            ),
      bottomNavigationBar: bottomNavbar(),
    );
  }
}
