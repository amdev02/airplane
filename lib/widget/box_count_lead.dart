import 'package:flutter/material.dart';
import 'package:varana_apps/theme/thema.dart';

class BoxCountLead extends StatelessWidget {
  const BoxCountLead({
    Key? key,
    required this.jumlahHarian,
    required this.jumlahMingguan,
    required this.jumlahBulanan,
  }) : super(key: key);

  final String jumlahHarian;
  final String jumlahMingguan;
  final String jumlahBulanan;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          child: Column(
            children: [
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  color: kLightGreenColor,
                  borderRadius: BorderRadius.circular(radius12),
                ),
                child: Center(
                  child: Text(
                    jumlahHarian,
                    style: blackTextStyle.copyWith(
                      fontSize: 22,
                      fontWeight: semiBold,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Hari Ini",
                style: blackTextStyle.copyWith(
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
        Container(
          child: Column(
            children: [
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  color: kLightGreenColor,
                  borderRadius: BorderRadius.circular(radius12),
                ),
                child: Center(
                  child: Text(
                    jumlahMingguan,
                    style: blackTextStyle.copyWith(
                      fontSize: 22,
                      fontWeight: semiBold,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Minggu Ini",
                style: blackTextStyle.copyWith(
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
        Container(
          child: Column(
            children: [
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  color: kLightGreenColor,
                  borderRadius: BorderRadius.circular(radius12),
                ),
                child: Center(
                  child: Text(
                    jumlahBulanan,
                    style: blackTextStyle.copyWith(
                      fontSize: 22,
                      fontWeight: semiBold,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Bulan Ini",
                style: blackTextStyle.copyWith(
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
