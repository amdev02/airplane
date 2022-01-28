import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;
import 'package:async/async.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:varana_apps/services/api.dart';
import 'package:varana_apps/theme/thema.dart';
import 'package:varana_apps/widget/button_in_loading.dart';
import 'dart:math' as Math;
import 'package:image/image.dart' as img;
import 'package:path_provider/path_provider.dart';

class SpvAddAbsen extends StatefulWidget {
  const SpvAddAbsen({Key? key}) : super(key: key);

  @override
  _SpvAddAbsenState createState() => _SpvAddAbsenState();
}

class _SpvAddAbsenState extends State<SpvAddAbsen> {
  var isLoading = false;

  File? _image;
  final ImagePicker _picker = ImagePicker();

  cameraPicker() async {
    final XFile? imagePick =
        await _picker.pickImage(source: ImageSource.camera);
    final tempDir = await getTemporaryDirectory();
    final path = tempDir.path;

    int rand = new Math.Random().nextInt(10000000);

    img.Image image = img.decodeImage(File(imagePick!.path).readAsBytesSync())!;
    img.Image smalleImg = img.copyResize(image, width: 720);

    var compressImg = new File("$path/image_$rand.jpg")
      ..writeAsBytesSync(img.encodeJpg(smalleImg, quality: 85));

    setState(() {
      _image = compressImg;
    });
  }

  TextEditingController keteranganController = TextEditingController();
  String statusAbsen = "1";
  addAbsen() async {
    setState(() {
      isLoading = true;
    });

    try {
      SharedPreferences pref = await SharedPreferences.getInstance();
      var stream = http.ByteStream(DelegatingStream.typed(_image!.openRead()));
      var length = await _image!.length();
      var url = Uri.parse(BaseUrl.addAbsen);
      var request = http.MultipartRequest("POST", url);
      var multipartFile = http.MultipartFile("image", stream, length,
          filename: path.basename(_image!.path));
      request.fields['id_user'] = pref.getString("idUser")!;
      request.fields['keterangan'] = keteranganController.text;
      request.fields['status'] = statusAbsen;
      request.files.add(multipartFile);
      var response = await request.send();
      response.stream.transform(utf8.decoder).listen((value) {
        final data = jsonDecode(value);
        int getValue = data['value'];
        String message = data['message'];
        if (getValue == 1) {
          print(message);
          save();
        } else {
          print(message);
        }
      });
      setState(() {
        isLoading = false;
      });
    } catch (e) {}

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
    final response = await http.post(Uri.parse(BaseUrl.notifAbsen), body: {
      "id_sales": pref.getString("idUser"),
    });
  }

  @override
  void initState() {
    // TODO: implement initState
  }

  @override
  Widget build(BuildContext context) {
    AppBar header() {
      return AppBar(
        backgroundColor: kGreenColor,
        elevation: 1,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            size: 16,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          "Absen",
          style: whiteTextStyle.copyWith(
            fontSize: 16,
          ),
        ),
      );
    }

    Widget boxLocation() {
      return Container(
        margin: EdgeInsets.only(
          top: defaultMargin,
          left: defaultMargin,
          right: defaultMargin,
        ),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: kLightGreenColor,
          borderRadius: BorderRadius.circular(radius20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Lokasi Anda",
              style: blueTextStyle,
            ),
            Divider(
              color: kBlueColor,
            ),
            Text(
              "Mencari Lokasi",
              style: blueTextStyle.copyWith(
                fontSize: 18,
              ),
            ),
          ],
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

    Widget addPhoto() {
      return Container(
        width: double.infinity,
        height: 80,
        margin: EdgeInsets.all(defaultMargin),
        decoration: BoxDecoration(
            color: kLightGreenColor,
            borderRadius: BorderRadius.circular(radius20)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.add,
              color: kBlueColor,
              size: 18,
            ),
            Text(
              "Foto",
              style: blueTextStyle,
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
            margin: EdgeInsets.symmetric(horizontal: defaultMargin),
            width: double.infinity,
            decoration: BoxDecoration(
              color: kBlueColor,
              borderRadius: BorderRadius.circular(radius20),
            ),
            child: TextButton(
              onPressed: () {
                addAbsen();
                getNotif();
              },
              child: isLoading
                  ? LoadingInButton()
                  : Text(
                      "Konfirmasi",
                      style: whiteTextStyle,
                    ),
            ),
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: kWhiteColor,
      appBar: header(),
      body: ListView(
        children: [
          // boxLocation(),
          keteranganTextField(),
          GestureDetector(
            onTap: () {
              cameraPicker();
            },
            child: _image == null
                ? addPhoto()
                : Container(
                    margin: EdgeInsets.all(20),
                    child: Image.file(
                      File(_image!.path),
                      width: 300,
                    ),
                  ),
          ),
        ],
      ),
      bottomNavigationBar: bottomNavbar(),
    );
  }
}
