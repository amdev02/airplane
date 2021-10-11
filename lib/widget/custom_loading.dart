import 'package:flutter/material.dart';
import 'package:varana_apps/theme/thema.dart';

class CustomLoading extends StatelessWidget {
  const CustomLoading({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: kLightGreenColor,
          borderRadius: BorderRadius.circular(radius12),
        ),
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation(kBlueColor),
        ),
      ),
    );
  }
}
