import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:varana_apps/pages/users/head_markom_page.dart';
import 'package:varana_apps/pages/users/markom_page.dart';
import 'package:varana_apps/pages/users/owner_page.dart';
import 'package:varana_apps/pages/users/sales_page.dart';
import 'package:varana_apps/pages/users/spv_page.dart';
import 'package:varana_apps/services/api.dart';
import 'package:varana_apps/theme/thema.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:varana_apps/widget/button_in_loading.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  _SignInPageState createState() => _SignInPageState();
}

enum LoginStatus {
  notSignIn,
  signInSales,
  signInMarkom,
  signInHeadMarkom,
  signInSpv,
  signInOwner,
}

class _SignInPageState extends State<SignInPage> {
  LoginStatus _loginStatus = LoginStatus.notSignIn;

  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  var isLoading = false;

  handleSignIn() async {
    setState(() {
      isLoading = true;
    });
    final response = await http.post(Uri.parse(BaseUrl.signIn), body: {
      "username": usernameController.text,
      "password": passwordController.text,
    });
    if (response.statusCode == 200) {
      setState(() {
        isLoading = false;
      });
      final data = jsonDecode(response.body);
      print(data);
      int value = data['value'];
      String? message = data['message'];
      String? idUser = data['id_user'];
      String? username = data['username'];
      String? name_user = data['nama_user'];
      String? level = data['level'];
      String? active = data['active'];
      String? createDate = data['created'];
      String? id_markom = data['id_markom'];
      String? images = data['image'];
      String? token = data['token'];
      if (value == 1) {
        if (level == "1") {
          print(message);
          setState(() {
            _loginStatus = LoginStatus.signInSales;
            save(value, idUser!, username!, name_user!, level!, active!,
                createDate!, id_markom!, images!, token!);
          });
        } else if (level == "2") {
          print(message);
          setState(() {
            _loginStatus = LoginStatus.signInMarkom;
            save(value, idUser!, username!, name_user!, level!, active!,
                createDate!, id_markom!, images!, token!);
          });
        } else if (level == "3") {
          print(message);
          setState(() {
            _loginStatus = LoginStatus.signInOwner;
            save(value, idUser!, username!, name_user!, level!, active!,
                createDate!, id_markom!, images!, token!);
          });
        } else if (level == "4") {
          print(message);
          setState(() {
            _loginStatus = LoginStatus.signInSpv;
            save(value, idUser!, username!, name_user!, level!, active!,
                createDate!, id_markom!, images!, token!);
          });
        } else if (level == "5") {
          print(message);
          setState(() {
            _loginStatus = LoginStatus.signInHeadMarkom;
            save(value, idUser!, username!, name_user!, level!, active!,
                createDate!, id_markom!, images!, token!);
          });
        }
      } else {
        print(message);
        alertGagalLogin();
      }
    }
  }

  alertGagalLogin() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Text(
              "Maaf Username Atau Password Salah",
              style: blackTextStyle,
            ),
            actions: [
              TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: kGreenColor,
                ),
                onPressed: () => Navigator.pop(context),
                child: Text(
                  "Okay",
                  style: whiteTextStyle,
                ),
              ),
            ],
          );
        });
  }

  save(
    int value,
    String idUser,
    String username,
    String name_user,
    String level,
    String active,
    String createDate,
    String id_markom,
    String images,
    String token,
  ) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      pref.setInt("value", value);
      pref.setString("idUser", idUser);
      pref.setString("username", username);
      pref.setString("name_user", name_user);
      pref.setString("level", level);
      pref.setString("active", active);
      pref.setString("createDate", createDate);
      pref.setString("idMarkom", id_markom);
      pref.setString("images", images);
      pref.setString("token", token);
      pref.commit();
    });
  }

  var value;
  getPref() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    value = pref.getString("level");
    setState(() {
      _loginStatus = value == "1"
          ? LoginStatus.signInSales
          : _loginStatus = value == "2"
              ? LoginStatus.signInMarkom
              : _loginStatus = value == "3"
                  ? LoginStatus.signInOwner
                  : _loginStatus = value == "4"
                      ? LoginStatus.signInSpv
                      : _loginStatus = value == "5"
                          ? LoginStatus.signInHeadMarkom
                          : LoginStatus.notSignIn;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getPref();
  }

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return Container(
        margin: EdgeInsets.all(defaultMargin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Welcome Back!",
              style: whiteTextStyle.copyWith(
                fontSize: 20,
                fontWeight: semiBold,
              ),
            ),
            Center(
              child: Image.asset(
                "assets/varana.png",
                width: 200,
              ),
            ),
          ],
        ),
      );
    }

    Widget usernameTextField() {
      return Container(
        margin: EdgeInsets.only(top: 30),
        padding: EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          color: kGreenColor.withOpacity(0.2),
          borderRadius: BorderRadius.circular(radius20),
        ),
        child: TextFormField(
          style: blackTextStyle,
          controller: usernameController,
          decoration: InputDecoration(
            hintText: "Username",
            border: InputBorder.none,
          ),
        ),
      );
    }

    Widget passwordTextField() {
      return Container(
        margin: EdgeInsets.only(top: defaultMargin),
        padding: EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          color: kGreenColor.withOpacity(0.2),
          borderRadius: BorderRadius.circular(radius20),
        ),
        child: TextFormField(
          controller: passwordController,
          style: blackTextStyle,
          obscureText: true,
          decoration: InputDecoration(
            hintText: "Password",
            border: InputBorder.none,
          ),
        ),
      );
    }

    Widget buttonPrimary() {
      return Container(
        margin: EdgeInsets.only(top: 30),
        width: double.infinity,
        child: TextButton(
          onPressed: () {
            handleSignIn();
          },
          style: TextButton.styleFrom(
            backgroundColor: kBlueColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(radius20),
            ),
          ),
          child: isLoading
              ? LoadingInButton()
              : Text(
                  "Sign In",
                  style: whiteTextStyle.copyWith(
                    fontSize: 20,
                    fontWeight: semiBold,
                  ),
                ),
        ),
      );
    }

    Widget content() {
      return Expanded(
        child: Container(
          padding: EdgeInsets.all(defaultMargin),
          decoration: BoxDecoration(
            color: kWhiteColor,
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(radius20),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Sign In",
                style: blackTextStyle.copyWith(
                  fontSize: 20,
                  fontWeight: semiBold,
                ),
              ),
              usernameTextField(),
              passwordTextField(),
              buttonPrimary(),
              Spacer(),
              Center(
                child: Text(
                  "Jagorawi Golf Estate",
                  style: blackTextStyle,
                ),
              ),
            ],
          ),
        ),
      );
    }

    switch (_loginStatus) {
      case LoginStatus.notSignIn:
        return Scaffold(
          backgroundColor: kGreenColor,
          resizeToAvoidBottomInset: false,
          body: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                header(),
                content(),
              ],
            ),
          ),
        );
        // ignore: dead_code
        break;
      case LoginStatus.signInSales:
        return SalesPage();
        // ignore: dead_code
        break;
      case LoginStatus.signInMarkom:
        return MarkomPage();
        // ignore: dead_code
        break;
      case LoginStatus.signInOwner:
        return OwnerPage();
        // ignore: dead_code
        break;
      case LoginStatus.signInSpv:
        return SpvPage();
        // ignore: dead_code
        break;
      case LoginStatus.signInHeadMarkom:
        return HeadMarkomPage();
    }
  }
}
