import 'package:flutter/material.dart';
import 'package:varana_apps/theme/thema.dart';

class TitlePage extends StatelessWidget {
  const TitlePage({
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: blackTextStyle.copyWith(
        fontSize: 18,
        fontWeight: semiBold,
      ),
    );
  }
}
