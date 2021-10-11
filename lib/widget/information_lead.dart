import 'package:flutter/material.dart';
import 'package:varana_apps/theme/thema.dart';

class InformationLead extends StatelessWidget {
  const InformationLead({
    Key? key,
    required this.name,
    required this.sumber,
    required this.noWa,
    required this.tanggal,
  }) : super(key: key);

  final String name;
  final String noWa;
  final String sumber;
  final String tanggal;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: defaultMargin,
        left: defaultMargin,
        right: defaultMargin,
      ),
      width: double.infinity,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: kGreenColor,
        borderRadius: BorderRadius.circular(radius12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Informasi Customer",
            style: blueTextStyle,
          ),
          Divider(
            color: kBlueColor,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Nama",
                style: whiteTextStyle,
              ),
              Text(
                name,
                style: whiteTextStyle,
              ),
            ],
          ),
          SizedBox(
            height: 12,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "No. Whatsapp",
                style: whiteTextStyle,
              ),
              Text(
                noWa,
                style: whiteTextStyle,
              ),
            ],
          ),
          SizedBox(
            height: 12,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Sumber",
                style: whiteTextStyle,
              ),
              Text(
                sumber,
                style: whiteTextStyle,
              ),
            ],
          ),
          SizedBox(
            height: 12,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Tanggal",
                style: whiteTextStyle,
              ),
              Text(
                tanggal,
                style: whiteTextStyle,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
