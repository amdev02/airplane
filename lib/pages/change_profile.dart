import 'package:flutter/material.dart';
import 'package:varana_apps/pages/change_image.dart';
import 'package:varana_apps/pages/change_name.dart';
import 'package:varana_apps/pages/change_password.dart';
import 'package:varana_apps/pages/change_username.dart';
import 'package:varana_apps/theme/thema.dart';
import 'package:varana_apps/widget/page_reminder.dart';

class ChangeProfile extends StatelessWidget {
  final VoidCallback reload;
  ChangeProfile(this.reload);
  @override
  Widget build(BuildContext context) {
    Widget content() {
      return Container(
        padding: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            PageReminder(
              icon: Icons.image_outlined,
              title: "Ganti Image",
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ChangeImage()));
              },
            ),
            SizedBox(
              height: 20,
            ),
            PageReminder(
              icon: Icons.ac_unit_outlined,
              title: "Ganti Nama",
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ChangeName()));
              },
            ),
            SizedBox(
              height: 20,
            ),
            PageReminder(
              icon: Icons.person_outline,
              title: "Ganti Username",
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ChangeUsername()));
              },
            ),
            SizedBox(
              height: 20,
            ),
            PageReminder(
              icon: Icons.lock_outline,
              title: "Ganti Password",
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ChangePassword()));
              },
            ),
          ],
        ),
      );
    }

    AppBar header() {
      return AppBar(
        backgroundColor: kWhiteColor,
        elevation: 0,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(
            Icons.close,
            color: kBlackColor,
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: kWhiteColor,
      appBar: header(),
      body: content(),
    );
  }
}
