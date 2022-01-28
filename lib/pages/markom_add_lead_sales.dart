import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:varana_apps/services/api.dart';
import 'package:varana_apps/theme/thema.dart';
import 'package:http/http.dart' as http;

class AddLeadSales extends StatefulWidget {
  @override
  _AddLeadSalesState createState() => _AddLeadSalesState();
}

class _AddLeadSalesState extends State<AddLeadSales> {
  var sumberSelection;
  var rumahSelection;
  var pembayaranSelection;
  var salesSelection;

  List listSumber = [
    'Iklan Pribadi',
    'Database Pribadi',
    "WI",
    'Canvasing/Flyering',
    'Head Markom',
  ];

  List<dynamic> listRumah = [];
  List listPembayaran = ['KPR', 'Cash Keras', 'Cash Bertahap'];
  List<dynamic> listSales = [];
  TextEditingController namaController = TextEditingController();
  TextEditingController alamatController = TextEditingController();
  TextEditingController noTelpController = TextEditingController();
  TextEditingController keteranganController = TextEditingController();
  TextEditingController feeController = TextEditingController();

  String sumber = "";

  DateTime? datePickAdd;

  void showDatePickAdd() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
      helpText: "Pilih Tanggal Visit",
    ).then((value) {
      if (value == null) {
        return;
      } else {
        setState(() {
          datePickAdd = value;
        });
      }
    });
  }

  DateTime? datePickReserv;

  void showDatePickReserv() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
      helpText: "Pilih Tanggal Visit",
    ).then((value) {
      if (value == null) {
        return;
      } else {
        setState(() {
          datePickReserv = value;
        });
      }
    });
  }

  selectedRumah() async {
    final response = await http.post(Uri.parse(BaseUrl.getHomeByStatus), body: {
      "status": '1',
    });
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      print(data);
      setState(() {
        listRumah = data;
      });
    }
  }

  selectedSales() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    final response = await http.post(Uri.parse(BaseUrl.getUserByMarkom), body: {
      'id': pref.getString('idUser'),
    });
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      print(data);
      setState(() {
        listSales = data;
      });
    }
  }

  addNewLead() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    final response =
        await http.post(Uri.parse(BaseUrl.addLeadFromSales), body: {
      "nama_lengkap": namaController.text,
      "no_whatsapp": noTelpController.text,
      "tgl_add": datePickAdd.toString(),
      "tgl_reservasi": datePickReserv.toString(),
      "alamat": alamatController.text,
      "keterangan": keteranganController.text,
      "sumber": sumberSelection,
      "id_sales": salesSelection,
      "id_markom": pref.getString("idUser"),
      "id_rumah": rumahSelection,
      "fee_reservasi": feeController.text,
      "jenis_pembayaran": pembayaranSelection,
    });
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      int value = data['value'];
      String message = data['message'];
      if (value == 1) {
        print(message);
        print("Sumber $sumberSelection");
        Navigator.pop(context);
      } else {
        print(message);
        print(sumber);
      }
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    selectedRumah();
    selectedSales();
  }

  @override
  Widget build(BuildContext context) {
    AppBar header() {
      return AppBar(
        backgroundColor: kGreenColor,
        elevation: 1,
        leading: Icon(
          Icons.arrow_back_ios,
          size: 16,
        ),
        title: Text(
          "Tambah Lead Sales",
          style: whiteTextStyle.copyWith(
            fontSize: 16,
          ),
        ),
      );
    }

    Widget nameTextField() {
      return Container(
        margin: EdgeInsets.only(top: 30),
        padding: EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          color: kLightGreenColor,
          borderRadius: BorderRadius.circular(radius20),
        ),
        child: TextFormField(
          style: blackTextStyle,
          controller: namaController,
          decoration: InputDecoration(
            hintText: "Nama Lengkap",
            border: InputBorder.none,
          ),
        ),
      );
    }

    Widget noTelpTextField() {
      return Container(
        margin: EdgeInsets.only(top: defaultMargin),
        padding: EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          color: kLightGreenColor,
          borderRadius: BorderRadius.circular(radius20),
        ),
        child: TextFormField(
          keyboardType: TextInputType.number,
          style: blackTextStyle,
          controller: noTelpController,
          decoration: InputDecoration(
            hintText: "No. Telepon",
            border: InputBorder.none,
          ),
        ),
      );
    }

    Widget alamatTextField() {
      return Container(
        margin: EdgeInsets.only(top: defaultMargin),
        padding: EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          color: kLightGreenColor,
          borderRadius: BorderRadius.circular(radius20),
        ),
        child: TextFormField(
          style: blackTextStyle,
          controller: alamatController,
          decoration: InputDecoration(
            hintText: "Alamat",
            border: InputBorder.none,
          ),
        ),
      );
    }

    Widget keteranganTextField() {
      return Container(
        margin: EdgeInsets.only(top: defaultMargin),
        padding: EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          color: kLightGreenColor,
          borderRadius: BorderRadius.circular(radius20),
        ),
        child: TextFormField(
          maxLines: 3,
          style: blackTextStyle,
          controller: keteranganController,
          decoration: InputDecoration(
            hintText: "Keterangan",
            border: InputBorder.none,
          ),
        ),
      );
    }

    final _form = GlobalKey<FormState>();

    Widget sumberDropdown() {
      return Container(
        margin: EdgeInsets.only(top: defaultMargin),
        padding: EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          color: kLightGreenColor,
          borderRadius: BorderRadius.circular(radius20),
        ),
        child: DropdownButtonFormField(
          hint: Text(
            "Pilih Sumber",
          ),
          onSaved: (e) => sumberSelection,
          value: sumberSelection,
          style: blackTextStyle,
          decoration: InputDecoration(
            border: InputBorder.none,
          ),
          items: listSumber.map((value) {
            return DropdownMenuItem(
              child: Text(
                value,
                style: blackTextStyle,
              ),
              value: value,
            );
          }).toList(),
          onChanged: (newvalue) {
            setState(() {
              sumberSelection = newvalue;
            });
          },
        ),
      );
    }

    Widget rumahDropdown() {
      return Container(
        margin: EdgeInsets.only(
          top: defaultMargin,
        ),
        padding: EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          color: kLightGreenColor,
          borderRadius: BorderRadius.circular(radius20),
        ),
        child: DropdownButtonFormField(
          hint: Text(
            "Pilih Rumah",
          ),
          onSaved: (e) => rumahSelection,
          value: rumahSelection,
          style: blackTextStyle,
          decoration: InputDecoration(
            border: InputBorder.none,
          ),
          items: listRumah.map((value) {
            return DropdownMenuItem(
              child: Text(
                "${value['no_rumah']} - ${value['tipe_rumah']}",
                style: blackTextStyle,
              ),
              value: value['id_rumah'],
            );
          }).toList(),
          onChanged: (newvalue) {
            setState(() {
              rumahSelection = newvalue;
            });
          },
        ),
      );
    }

    Widget salesDropdown() {
      return Container(
        margin: EdgeInsets.only(
          top: defaultMargin,
        ),
        padding: EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          color: kLightGreenColor,
          borderRadius: BorderRadius.circular(radius20),
        ),
        child: DropdownButtonFormField(
          hint: Text(
            "Pilih Sales",
          ),
          onSaved: (e) => salesSelection,
          value: salesSelection,
          style: blackTextStyle,
          decoration: InputDecoration(
            border: InputBorder.none,
          ),
          items: listSales.map((value) {
            return DropdownMenuItem(
              child: Text(
                "${value['nama_user']}",
                style: blackTextStyle,
              ),
              value: value['id_user'],
            );
          }).toList(),
          onChanged: (newvalue) {
            setState(() {
              salesSelection = newvalue;
            });
          },
        ),
      );
    }

    Widget feeTextField() {
      return Container(
        margin: EdgeInsets.only(
          top: defaultMargin,
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
            hintText: "Fee Reservasi",
            border: InputBorder.none,
          ),
        ),
      );
    }

    Widget jenisPembayaranDropdown() {
      return Container(
        margin: EdgeInsets.only(
          top: defaultMargin,
        ),
        padding: EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          color: kLightGreenColor,
          borderRadius: BorderRadius.circular(radius20),
        ),
        child: DropdownButtonFormField(
          hint: Text(
            "Pilih Jenis Pembayaran",
          ),
          onSaved: (e) => pembayaranSelection,
          value: pembayaranSelection,
          style: blackTextStyle,
          decoration: InputDecoration(
            border: InputBorder.none,
          ),
          items: listPembayaran.map((value) {
            return DropdownMenuItem(
              child: Text(
                value,
                style: blackTextStyle,
              ),
              value: value,
            );
          }).toList(),
          onChanged: (newvalue) {
            setState(() {
              pembayaranSelection = newvalue;
            });
          },
        ),
      );
    }

    Widget button() {
      return Container(
        margin: EdgeInsets.only(
          top: defaultMargin,
        ),
        child: TextButton(
          child: Text(
            "Simpan",
            style: whiteTextStyle,
          ),
          style: TextButton.styleFrom(
            backgroundColor: kBlueColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(radius20),
            ),
          ),
          onPressed: () {
            if (_form.currentState!.validate()) {
              _form.currentState!.save();
              addNewLead();
            }
            // getNotif();
          },
        ),
      );
    }

    Widget tanggalAdd() {
      return Container(
        margin: EdgeInsets.only(
          top: defaultMargin,
        ),
        child: Row(
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: kLightGreenColor,
                  borderRadius: BorderRadius.circular(radius20),
                ),
                child: Text(
                  datePickAdd == null
                      ? "Pilih Tanggal"
                      : "${DateFormat.yMMMMd().format(datePickAdd!)}",
                  style: blackTextStyle,
                ),
              ),
            ),
            SizedBox(
              width: 12,
            ),
            Container(
              decoration: BoxDecoration(
                color: kBlueColor,
                borderRadius: BorderRadius.circular(radius12),
              ),
              child: IconButton(
                onPressed: () {
                  showDatePickAdd();
                },
                icon: Icon(
                  Icons.calendar_today_outlined,
                  color: kWhiteColor,
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget tanggalReserv() {
      return Container(
        margin: EdgeInsets.only(
          top: defaultMargin,
        ),
        child: Row(
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: kLightGreenColor,
                  borderRadius: BorderRadius.circular(radius20),
                ),
                child: Text(
                  datePickReserv == null
                      ? "Tanggal Reservasi"
                      : "${DateFormat.yMMMMd().format(datePickReserv!)}",
                  style: blackTextStyle,
                ),
              ),
            ),
            SizedBox(
              width: 12,
            ),
            Container(
              decoration: BoxDecoration(
                color: kBlueColor,
                borderRadius: BorderRadius.circular(radius12),
              ),
              child: IconButton(
                onPressed: () {
                  showDatePickReserv();
                },
                icon: Icon(
                  Icons.calendar_today_outlined,
                  color: kWhiteColor,
                ),
              ),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      appBar: header(),
      body: Container(
        padding: EdgeInsets.symmetric(
          horizontal: defaultMargin,
        ),
        decoration: BoxDecoration(
          color: kWhiteColor,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(radius20),
          ),
        ),
        child: Form(
          key: _form,
          child: ListView(
            children: [
              nameTextField(),
              alamatTextField(),
              noTelpTextField(),
              keteranganTextField(),
              feeTextField(),
              tanggalAdd(),
              tanggalReserv(),
              sumberDropdown(),
              rumahDropdown(),
              salesDropdown(),
              jenisPembayaranDropdown(),
              button(),
            ],
          ),
        ),
      ),
    );
  }
}
