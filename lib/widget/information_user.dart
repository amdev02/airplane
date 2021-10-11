import 'package:flutter/material.dart';
import 'package:varana_apps/theme/thema.dart';

class InformationUser extends StatelessWidget {
  const InformationUser({
    Key? key,
    required this.name,
    required this.imageUrl,
  }) : super(key: key);

  final String name;
  final String imageUrl;
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
          CircleAvatar(
            backgroundColor: kBlackColor,
            backgroundImage: NetworkImage(imageUrl),
            radius: 15,
          ),
          SizedBox(
            width: 12,
          ),
          Text(
            name,
            style: whiteTextStyle,
          ),
        ],
      ),
    );
  }
}
