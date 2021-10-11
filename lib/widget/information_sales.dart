import 'package:flutter/material.dart';
import 'package:varana_apps/services/api.dart';
import 'package:varana_apps/theme/thema.dart';

class InformationSales extends StatelessWidget {
  const InformationSales({
    Key? key,
    required this.imagesSales,
    required this.nameSales,
  }) : super(key: key);

  final String imagesSales;
  final String nameSales;

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
      child: Row(
        children: [
          imagesSales == null
              ? CircleAvatar(
                  backgroundColor: kBlackColor,
                  backgroundImage: AssetImage("assets/profile.png"),
                  radius: 15,
                )
              : CircleAvatar(
                  backgroundColor: kBlackColor,
                  backgroundImage: NetworkImage(BaseUrl.imageUrl + imagesSales),
                  radius: 15,
                ),
          SizedBox(
            width: 12,
          ),
          Text(
            nameSales == null ? "Tidak Ditemukan" : nameSales,
            style: whiteTextStyle,
          ),
        ],
      ),
    );
  }
}
