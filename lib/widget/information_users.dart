import 'package:flutter/material.dart';
import 'package:varana_apps/theme/thema.dart';

class InformationUsers extends StatelessWidget {
  const InformationUsers({
    Key? key,
    required this.nameSales,
    required this.nameMarkom,
  }) : super(key: key);

  final String nameSales;
  final String nameMarkom;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: defaultMargin,
        left: defaultMargin,
        right: defaultMargin,
      ),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: kGreenColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Sales",
                style: blueTextStyle.copyWith(
                  fontSize: 12,
                ),
              ),
              Text(
                nameSales == null ? "Tidak Ditemukan" : nameSales,
                style: whiteTextStyle,
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Markom",
                style: blueTextStyle.copyWith(
                  fontSize: 12,
                ),
              ),
              Text(
                nameMarkom == null ? "Tidak Ditemukan" : nameMarkom,
                style: whiteTextStyle,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
