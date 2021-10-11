import 'package:flutter/material.dart';
import 'package:varana_apps/theme/thema.dart';

class PageReminder extends StatelessWidget {
  const PageReminder({
    Key? key,
    required this.icon,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  final IconData icon;
  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: kLightGreenColor,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              icon,
              color: kBlueColor,
            ),
          ),
          SizedBox(
            width: 12,
          ),
          Text(
            title,
            style: blackTextStyle.copyWith(
              fontSize: 16,
            ),
          ),
          Spacer(),
          Icon(
            Icons.arrow_forward_ios,
            color: kBlueColor,
            size: 14,
          ),
        ],
      ),
    );
  }
}
