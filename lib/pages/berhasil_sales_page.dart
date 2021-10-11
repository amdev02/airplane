import 'package:flutter/material.dart';
import 'package:varana_apps/theme/thema.dart';

class BerhasilSalesPage extends StatelessWidget {
  const BerhasilSalesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kGreenColor,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(defaultMargin),
              width: double.infinity,
              decoration: BoxDecoration(
                color: kGreenColor,
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(radius20),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/success.png",
                    width: 200,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Berhasil!",
                    style: blueTextStyle.copyWith(
                      fontSize: 32,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
