import 'package:flutter/material.dart';
import 'package:varana_apps/services/api.dart';
import 'package:varana_apps/theme/thema.dart';

class CardAbsen extends StatelessWidget {
  const CardAbsen({
    Key? key,
    this.name,
    this.imagesProfile,
    this.imagesAbsen,
    this.date,
    this.status,
    this.keterangan,
  }) : super(key: key);

  final String? name;
  final String? imagesProfile;
  final String? imagesAbsen;
  final String? date;
  final String? status;
  final String? keterangan;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(defaultMargin),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: kGreenColor,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: kLightGreenColor,
            blurRadius: 40,
            offset: Offset(0, 2),
          )
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundColor: kBlueColor,
                backgroundImage:
                    NetworkImage(BaseUrl.imageUrl + imagesProfile!),
                radius: 25,
              ),
              SizedBox(
                width: 12,
              ),
              Text(
                name!,
                style: whiteTextStyle.copyWith(
                  fontSize: 16,
                ),
              ),
            ],
          ),
          Divider(
            color: kBlueColor,
          ),
          SizedBox(
            height: 12,
          ),
          Row(
            children: [
              Container(
                width: 150,
                height: 200,
                decoration: BoxDecoration(
                  color: kBlueColor,
                  borderRadius: BorderRadius.circular(12),
                  image: DecorationImage(
                    image: NetworkImage(BaseUrl.absenUrl + imagesAbsen!),
                  ),
                ),
              ),
              SizedBox(
                width: 12,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      keterangan!,
                      style: whiteTextStyle,
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 12),
          Divider(
            color: kBlueColor,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                date!,
                style: whiteTextStyle,
              ),
              Text(
                status!,
                style: whiteTextStyle,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
