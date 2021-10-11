import 'package:flutter/material.dart';
import 'package:varana_apps/theme/thema.dart';

class ProductKnowladgePage extends StatefulWidget {
  const ProductKnowladgePage({Key? key}) : super(key: key);

  @override
  _ProductKnowladgePageState createState() => _ProductKnowladgePageState();
}

class _ProductKnowladgePageState extends State<ProductKnowladgePage> {
  @override
  Widget build(BuildContext context) {
    Widget header() {
      return Container(
        width: double.infinity,
        height: 280,
        decoration: BoxDecoration(
          color: kGreenColor,
          image: DecorationImage(image: AssetImage("assets/jge.png")),
        ),
      );
    }

    Widget logoVaranaVertical() {
      return Image.asset(
        "assets/VARANA_logo-horizontal.png",
        width: 100,
      );
    }

    Widget mainGate() {
      return Container(
        margin: EdgeInsets.all(20),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(radius20),
              child: Image.asset("assets/main_gate.jpg"),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Main Gate",
              style: blueTextStyle.copyWith(
                fontSize: 16,
              ),
            ),
          ],
        ),
      );
    }

    Widget pictRumah80() {
      return Container(
        margin: EdgeInsets.all(20),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(radius20),
              child: Image.asset("assets/80_98.jpg"),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Tipe 80/98",
              style: blueTextStyle.copyWith(
                fontSize: 16,
              ),
            ),
          ],
        ),
      );
    }

    Widget denahRumah80() {
      return Container(
        margin: EdgeInsets.all(20),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(radius20),
              child: Image.asset("assets/tipe_80_98.jpg"),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Denah Rumah 80/98",
              style: blueTextStyle.copyWith(
                fontSize: 16,
              ),
            ),
          ],
        ),
      );
    }

    Widget spek80() {
      return Container(
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.all(defaultMargin),
        decoration: BoxDecoration(
          color: kGreenColor,
          borderRadius: BorderRadius.circular(radius20),
        ),
        child: Column(
          children: [
            Text(
              "Tipe Rumah 80/98",
              style: blueTextStyle.copyWith(
                fontSize: 18,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Luas bangunan 80m persegi dengan luas tanah 98m persegi Lebar 7 meter, panjang 14 meter",
              style: whiteTextStyle.copyWith(
                fontSize: 12,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "1 Teras",
              style: whiteTextStyle,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "1 Ruang Makan",
              style: whiteTextStyle,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "1 Ruang Tamu",
              style: whiteTextStyle,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "2 Carport",
              style: whiteTextStyle,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "2 Kamar Mandi",
              style: whiteTextStyle,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "3 Kamar Tidur",
              style: whiteTextStyle,
            ),
          ],
        ),
      );
    }

    Widget pictRumah115() {
      return Container(
        margin: EdgeInsets.all(20),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(radius20),
              child: Image.asset("assets/115_126.jpg"),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Tipe 115/126",
              style: blueTextStyle.copyWith(
                fontSize: 16,
              ),
            ),
          ],
        ),
      );
    }

    Widget denahRumah115() {
      return Container(
        margin: EdgeInsets.all(20),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(radius20),
              child: Image.asset("assets/tipe_115-126.jpg"),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Denah Rumah 115/126",
              style: blueTextStyle.copyWith(
                fontSize: 16,
              ),
            ),
          ],
        ),
      );
    }

    Widget spek115() {
      return Container(
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.all(defaultMargin),
        decoration: BoxDecoration(
          color: kGreenColor,
          borderRadius: BorderRadius.circular(radius20),
        ),
        child: Column(
          children: [
            Text(
              "Tipe Rumah 115/126",
              style: blueTextStyle.copyWith(
                fontSize: 18,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Luas bangunan 80m persegi dengan luas tanah 98m persegi Lebar 9 meter, panjang 14 meter",
              style: whiteTextStyle.copyWith(
                fontSize: 12,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "1 Teras",
              style: whiteTextStyle,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "1 Ruang Makan",
              style: whiteTextStyle,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "1 Ruang Tamu",
              style: whiteTextStyle,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "2 Carport",
              style: whiteTextStyle,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "2 Kamar Mandi",
              style: whiteTextStyle,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "4 Kamar Tidur",
              style: whiteTextStyle,
            ),
          ],
        ),
      );
    }

    Widget spefisikasi() {
      return Container(
        width: double.infinity,
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.symmetric(
          horizontal: defaultMargin,
        ),
        decoration: BoxDecoration(
          color: kGreenColor,
          borderRadius: BorderRadius.circular(radius20),
        ),
        child: Column(
          children: [
            Text(
              "Spesifikasi",
              style: blueTextStyle.copyWith(
                fontSize: 18,
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                top: 10,
              ),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Dinding",
                    style: blueTextStyle,
                  ),
                  Text(
                    "Bata Ringan",
                    style: whiteTextStyle,
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                top: 10,
              ),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Lantai",
                    style: blueTextStyle,
                  ),
                  Text(
                    "Homogeneous Tile",
                    style: whiteTextStyle,
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                top: 10,
              ),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Rangka Atap",
                    style: blueTextStyle,
                  ),
                  Text(
                    "Baja Ringan",
                    style: whiteTextStyle,
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                top: 10,
              ),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Penutup Atam",
                    style: blueTextStyle,
                  ),
                  Text(
                    "Genteng Beton",
                    style: whiteTextStyle,
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                top: 10,
              ),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Kusen",
                    style: blueTextStyle,
                  ),
                  Text(
                    "Alumunium",
                    style: whiteTextStyle,
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                top: 10,
              ),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Pintu Utama",
                    style: blueTextStyle,
                  ),
                  Text(
                    "Solid Engineered With Digital Fingerprint Door Lock",
                    style: whiteTextStyle,
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                top: 10,
              ),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Plafond",
                    style: blueTextStyle,
                  ),
                  Text(
                    "Painted Gypsum Board",
                    style: whiteTextStyle,
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                top: 10,
              ),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Sanitary",
                    style: blueTextStyle,
                  ),
                  Text(
                    "Toto",
                    style: whiteTextStyle,
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                top: 10,
              ),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Kunci dan Handle",
                    style: blueTextStyle,
                  ),
                  Text(
                    "Paloma",
                    style: whiteTextStyle,
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                top: 10,
              ),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Air",
                    style: blueTextStyle,
                  ),
                  Text(
                    "Sumur Bor",
                    style: whiteTextStyle,
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                top: 10,
              ),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Daya Listrik",
                    style: blueTextStyle,
                  ),
                  Text(
                    "3500 Watt",
                    style: whiteTextStyle,
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }

    Widget lokasiStrategis() {
      return Container(
        margin: EdgeInsets.only(
          top: defaultMargin,
          left: defaultMargin,
          right: defaultMargin,
        ),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: kGreenColor,
          borderRadius: BorderRadius.circular(radius20),
        ),
        child: Column(
          children: [
            Text(
              "Lokasi Strategis",
              style: blueTextStyle.copyWith(
                fontSize: 18,
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                top: 10,
              ),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "1 Menit",
                    style: blueTextStyle,
                  ),
                  Text(
                    "Jagorawi Golf Estate",
                    style: whiteTextStyle,
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                top: 10,
              ),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "10 Menit",
                    style: blueTextStyle,
                  ),
                  Text(
                    "SMP Karanggan",
                    style: whiteTextStyle,
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                top: 10,
              ),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "15 Menit",
                    style: blueTextStyle,
                  ),
                  Text(
                    "Rs Annisa",
                    style: whiteTextStyle,
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                top: 10,
              ),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "18 Menit",
                    style: blueTextStyle,
                  ),
                  Text(
                    "Rs Sentra Medika",
                    style: whiteTextStyle,
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                top: 10,
              ),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "20 Menit",
                    style: blueTextStyle,
                  ),
                  Text(
                    "Rs Bina Husada",
                    style: whiteTextStyle,
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                top: 10,
              ),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "20 Menit",
                    style: blueTextStyle,
                  ),
                  Text(
                    "Cibinong City Mall",
                    style: whiteTextStyle,
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                top: 10,
              ),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "23 Menit",
                    style: blueTextStyle,
                  ),
                  Text(
                    "Pemda Cibinong",
                    style: whiteTextStyle,
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                top: 10,
              ),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "23 Menit",
                    style: blueTextStyle,
                  ),
                  Text(
                    "Stadion Pakansari",
                    style: whiteTextStyle,
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                top: 10,
              ),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "25 Menit",
                    style: blueTextStyle,
                  ),
                  Text(
                    "Sirkuit Sentul",
                    style: whiteTextStyle,
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                top: 10,
              ),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "25 Menit",
                    style: blueTextStyle,
                  ),
                  Text(
                    "Aeon Mall Sentul",
                    style: whiteTextStyle,
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }

    Widget aksesMudah() {
      return Container(
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.all(defaultMargin),
        decoration: BoxDecoration(
          color: kGreenColor,
          borderRadius: BorderRadius.circular(radius20),
        ),
        child: Column(
          children: [
            Text(
              "Lokasi Strategis",
              style: blueTextStyle.copyWith(
                fontSize: 18,
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                top: 10,
              ),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "1 Menit",
                    style: blueTextStyle,
                  ),
                  Text(
                    "Toll Karanggan",
                    style: whiteTextStyle,
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                top: 10,
              ),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "5 Menit",
                    style: blueTextStyle,
                  ),
                  Text(
                    "Toll Citeureup",
                    style: whiteTextStyle,
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                top: 10,
              ),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "15 Menit",
                    style: blueTextStyle,
                  ),
                  Text(
                    "Stasiun Cibinong",
                    style: whiteTextStyle,
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                top: 10,
              ),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "15 Menit",
                    style: blueTextStyle,
                  ),
                  Text(
                    "Terminal Cibinong",
                    style: whiteTextStyle,
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                top: 10,
              ),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "20 Menit",
                    style: blueTextStyle,
                  ),
                  Text(
                    "Terminal Bis Bandara CCM",
                    style: whiteTextStyle,
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }

    Widget fasilitas() {
      return Container(
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.symmetric(
          horizontal: defaultMargin,
        ),
        decoration: BoxDecoration(
          color: kGreenColor,
          borderRadius: BorderRadius.circular(radius20),
        ),
        child: Column(
          children: [
            Text(
              "Fasilitas",
              style: blueTextStyle.copyWith(
                fontSize: 18,
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                top: 10,
              ),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Keamanan 24 Jam",
                    style: blueTextStyle.copyWith(
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    "Security di bagi menjadi 2 shift yaitu jam 7 pagi - 7 malam, lalu dilanjukan jam 7 malam - 7 pagi.",
                    style: whiteTextStyle,
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                top: 10,
              ),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "CCTV 24 Jam",
                    style: blueTextStyle.copyWith(
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    "CCTV 24 jam yang ditempatkan di setiap sisi akan membuat perumahan selalu terpantau oleh para petugas keamanan.",
                    style: whiteTextStyle,
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                top: 10,
              ),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Club House",
                    style: blueTextStyle.copyWith(
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    "Club House memiliki beberapa fungsi yang di manfaatkan oleh para penghuni, diantaranya: alternative ruang tamu penghuni, gebyar temu antar penghuni, sarana olahraga, taman bermain anak, dan area bersantai ria.",
                    style: whiteTextStyle,
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                top: 10,
              ),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Jogging Track",
                    style: blueTextStyle.copyWith(
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    "Jogging Track di hadirkan untuk para penghuni sebagai tempay berolahraga. Dengan lingkungan asri yang dimiliki oleh Varana membuat Jogging Track menjadi lebih nyaman dan sehat.",
                    style: whiteTextStyle,
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }

    Widget modernConcept() {
      return Container(
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.only(
          top: defaultMargin,
          left: defaultMargin,
          right: defaultMargin,
        ),
        decoration: BoxDecoration(
          color: kGreenColor,
          borderRadius: BorderRadius.circular(radius20),
        ),
        child: Column(
          children: [
            Text(
              "Modern Concept",
              style: blueTextStyle.copyWith(
                fontSize: 18,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Varana Menggunakan High Ceiling Concept dengan tinggi 3.5 meter dan void dengan tinggi 6 meter (Floor to Ceiling). Lalu Cross Ventilation untuk jendela sehingga jendela lebih besar dengan tujuan agar pencahayaan dalam rumah lebih bagus, ditambah dengan konsep Tropical Modern dengan aksen kayu dan Planter Box di lantai atas/balkon",
              style: whiteTextStyle,
            ),
          ],
        ),
      );
    }

    Widget smartTechnologi() {
      return Container(
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.only(
          top: defaultMargin,
          left: defaultMargin,
          right: defaultMargin,
        ),
        decoration: BoxDecoration(
          color: kGreenColor,
          borderRadius: BorderRadius.circular(radius20),
        ),
        child: Column(
          children: [
            Text(
              "Smart Technology",
              style: blueTextStyle.copyWith(
                fontSize: 18,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Teknologi pintar yang digunakan oleh Varana salah satunya yaitu Solid Enginerred Wood with Digital Fingerprint Door Lock sebagai system keamanan untuk para penghuni, ditambah dengan lampu teras dengan Smart Home sehingga bisa di kontrol dengan handphone.",
              style: whiteTextStyle,
            ),
          ],
        ),
      );
    }

    Widget lingkunganAsri() {
      return Container(
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.only(
          top: defaultMargin,
          left: defaultMargin,
          right: defaultMargin,
        ),
        decoration: BoxDecoration(
          color: kGreenColor,
          borderRadius: BorderRadius.circular(radius20),
        ),
        child: Column(
          children: [
            Text(
              "Lingkungan Asri",
              style: blueTextStyle.copyWith(
                fontSize: 18,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Dari kedua konsep Varana, konsep terakhir Varana di lengkapi dengan lingkungan yang asri sebagai tempat hunian yang nyaman untuk di huni. Sebagai Cluster yang mengedepankan kenyamanan dari segi teknologi dan juga lingkungan yang memadai.",
              style: whiteTextStyle,
            ),
          ],
        ),
      );
    }

    Widget content() {
      return SingleChildScrollView(
        child: Container(
          child: Stack(
            children: [
              header(),
              Container(
                child: Column(
                  children: [
                    SizedBox(
                      height: 250,
                    ),
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: kWhiteColor,
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(radius20),
                        ),
                      ),
                      child: Column(
                        children: [
                          logoVaranaVertical(),
                          mainGate(),
                          pictRumah80(),
                          denahRumah80(),
                          spek80(),
                          pictRumah115(),
                          denahRumah115(),
                          spek115(),
                          spefisikasi(),
                          lokasiStrategis(),
                          aksesMudah(),
                          fasilitas(),
                          modernConcept(),
                          smartTechnologi(),
                          lingkunganAsri(),
                          SizedBox(
                            height: 80,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      body: content(),
    );
  }
}
