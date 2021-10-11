import 'package:flutter/material.dart';
import 'package:varana_apps/theme/thema.dart';

class DataNotFound extends StatelessWidget {
  const DataNotFound({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(
          "Data Belum Ada",
          style: blueTextStyle.copyWith(
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
