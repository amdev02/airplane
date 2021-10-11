import 'package:flutter/material.dart';
import 'package:varana_apps/theme/thema.dart';

class LoadingInButton extends StatelessWidget {
  const LoadingInButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 16,
          width: 16,
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation(kWhiteColor),
          ),
        ),
        SizedBox(width: 8),
        Text(
          "Loading",
          style: whiteTextStyle,
        ),
      ],
    );
  }
}
