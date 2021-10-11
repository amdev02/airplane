import 'package:flutter/material.dart';
import 'package:varana_apps/theme/thema.dart';

class BoxNumber extends StatelessWidget {
  const BoxNumber({
    Key? key,
    required this.number,
    required this.title,
  }) : super(key: key);

  final String number;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 70,
          height: 70,
          decoration: BoxDecoration(
            color: kLightGreenColor,
            borderRadius: BorderRadius.circular(radius12),
          ),
          child: Center(
            child: Text(
              number,
              style: blueTextStyle.copyWith(
                fontSize: 22,
                fontWeight: semiBold,
              ),
            ),
          ),
        ),
        SizedBox(
          height: 12,
        ),
        Text(
          title,
          style: blueTextStyle.copyWith(
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}
