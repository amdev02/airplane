import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:varana_apps/models/lead_model.dart';
import 'package:varana_apps/services/api.dart';
import 'package:varana_apps/theme/thema.dart';
import 'package:varana_apps/widget/button_in_loading.dart';

class SpvAddBookingPage extends StatefulWidget {
  final LeadModel model;
  SpvAddBookingPage(this.model);

  @override
  _SpvAddBookingPageState createState() => _SpvAddBookingPageState();
}

class _SpvAddBookingPageState extends State<SpvAddBookingPage> {
  var isLoading = false;

  TextEditingController feeController = TextEditingController();
  TextEditingController hargaController = TextEditingController();
  TextEditingController diskonController = TextEditingController();
  TextEditingController dpController = TextEditingController();
  TextEditingController diskonDpController = TextEditingController();
  TextEditingController keteranganController = TextEditingController();

  tambahBooking() async {
    setState(() {
      isLoading = true;
    });
    SharedPreferences pref = await SharedPreferences.getInstance();
    final response = await http.post(Uri.parse(BaseUrl.tambahBooking), body: {
      "id_lead": widget.model.id_lead,
      "fee_booking": feeController.text,
      "harga": hargaController.text,
      "diskon": diskonController.text,
      "dp": dpController.text,
      "diskon_dp": diskonDpController.text,
      "keterangan": keteranganController.text,
      "id_user": pref.getString("idUser"),
    });
    if (response.statusCode == 200) {
      save();
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
                        context, "/spv-page", (route) => false),
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

  getNotif() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    final response = await http.post(Uri.parse(BaseUrl.notifBooking), body: {
      "id_sales": pref.getString("idUser"),
    });
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
          "Tambah Booking",
          style: whiteTextStyle.copyWith(
            fontSize: 16,
          ),
        ),
      );
    }

    Widget feeTextField() {
      return Container(
        margin: EdgeInsets.only(
          top: defaultMargin,
          left: defaultMargin,
          right: defaultMargin,
        ),
        padding: EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          color: kGreenColor.withOpacity(0.2),
          borderRadius: BorderRadius.circular(radius20),
        ),
        child: TextFormField(
          controller: feeController,
          style: blackTextStyle,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            hintText: "Fee Booking",
            border: InputBorder.none,
          ),
        ),
      );
    }

    Widget hargaTextField() {
      return Container(
        margin: EdgeInsets.only(
          top: defaultMargin,
          left: defaultMargin,
          right: defaultMargin,
        ),
        padding: EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          color: kGreenColor.withOpacity(0.2),
          borderRadius: BorderRadius.circular(radius20),
        ),
        child: TextFormField(
          controller: hargaController,
          style: blackTextStyle,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            hintText: "Harga",
            border: InputBorder.none,
          ),
        ),
      );
    }

    Widget diskonTextField() {
      return Container(
        margin: EdgeInsets.only(
          top: defaultMargin,
          left: defaultMargin,
          right: defaultMargin,
        ),
        padding: EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          color: kGreenColor.withOpacity(0.2),
          borderRadius: BorderRadius.circular(radius20),
        ),
        child: TextFormField(
          controller: diskonController,
          style: blackTextStyle,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            hintText: "Diskon Harga",
            border: InputBorder.none,
          ),
        ),
      );
    }

    Widget dpTextField() {
      return Container(
        margin: EdgeInsets.only(
          top: defaultMargin,
          left: defaultMargin,
          right: defaultMargin,
        ),
        padding: EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          color: kGreenColor.withOpacity(0.2),
          borderRadius: BorderRadius.circular(radius20),
        ),
        child: TextFormField(
          controller: dpController,
          style: blackTextStyle,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            hintText: "Downpayment",
            border: InputBorder.none,
          ),
        ),
      );
    }

    Widget diskonDpTextField() {
      return Container(
        margin: EdgeInsets.only(
          top: defaultMargin,
          left: defaultMargin,
          right: defaultMargin,
        ),
        padding: EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          color: kGreenColor.withOpacity(0.2),
          borderRadius: BorderRadius.circular(radius20),
        ),
        child: TextFormField(
          controller: diskonDpController,
          style: blackTextStyle,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            hintText: "Diskon Dp",
            border: InputBorder.none,
          ),
        ),
      );
    }

    Widget keteranganTextField() {
      return Container(
        margin: EdgeInsets.only(
          top: defaultMargin,
          left: defaultMargin,
          right: defaultMargin,
        ),
        padding: EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          color: kGreenColor.withOpacity(0.2),
          borderRadius: BorderRadius.circular(radius20),
        ),
        child: TextFormField(
          controller: keteranganController,
          style: blackTextStyle,
          maxLines: 3,
          decoration: InputDecoration(
            hintText: "Keterangan",
            border: InputBorder.none,
          ),
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
              margin: EdgeInsets.symmetric(horizontal: defaultMargin),
              width: double.infinity,
              decoration: BoxDecoration(
                color: kBlueColor,
                borderRadius: BorderRadius.circular(radius20),
              ),
              child: TextButton(
                onPressed: () {
                  tambahBooking();
                  getNotif();
                },
                child: isLoading
                    ? LoadingInButton()
                    : Text(
                        "Konfirmasi",
                        style: whiteTextStyle,
                      ),
              )),
        ),
      );
    }

    return Scaffold(
      appBar: header(),
      body: ListView(
        children: [
          feeTextField(),
          hargaTextField(),
          diskonTextField(),
          dpTextField(),
          diskonDpTextField(),
          keteranganTextField(),
        ],
      ),
      bottomNavigationBar: bottomNavbar(),
    );
  }
}
