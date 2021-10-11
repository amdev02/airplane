import 'package:flutter/material.dart';
import 'package:varana_apps/theme/thema.dart';

class InformationFeeReservasi extends StatelessWidget {
  const InformationFeeReservasi({
    Key? key,
    required this.feeReservasi,
  }) : super(key: key);

  final String feeReservasi;

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
        borderRadius: BorderRadius.circular(radius12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Fee Reservasi",
            style: blueTextStyle,
          ),
          Divider(
            color: kBlueColor,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Fee Reservasi",
                style: whiteTextStyle,
              ),
              Text(
                feeReservasi,
                style: whiteTextStyle,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
