import 'package:flutter/material.dart';
import 'package:varana_apps/pages/users/hm_account_page.dart';
import 'package:varana_apps/pages/users/hm_dashboard_page.dart';
import 'package:varana_apps/pages/users/hm_sold_page.dart';
import 'package:varana_apps/pages/users/hm_visit_page.dart';
import 'package:varana_apps/pages/users/spv_dashboard.dart';
import 'package:varana_apps/pages/users/spv_lead_page.dart';
import 'package:varana_apps/theme/thema.dart';

import 'hm_lead_page.dart';

class HeadMarkomPage extends StatefulWidget {
  const HeadMarkomPage({Key? key}) : super(key: key);

  @override
  _HeadMarkomPageState createState() => _HeadMarkomPageState();
}

class _HeadMarkomPageState extends State<HeadMarkomPage> {
  int currentIndex = 0;

  void onItemTapped(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final listPage = [
      HmDashboard(),
      HmLeadPage(),
      HmVisitPage(),
      HmSoldPage(),
      HmAccount(),
    ];

    final bottomNavbarItem = <BottomNavigationBarItem>[
      BottomNavigationBarItem(
        icon: Icon(Icons.dashboard_outlined),
        title: Text(
          "Dashboard",
          style: blackTextStyle,
        ),
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.assignment_outlined),
        title: Text(
          "Lead",
          style: blackTextStyle,
        ),
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.home_outlined),
        title: Text(
          "Visit",
          style: blackTextStyle,
        ),
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.bookmark_outline),
        title: Text(
          "Sold",
          style: blackTextStyle,
        ),
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.person_outlined),
        title: Text(
          "Account",
          style: blackTextStyle,
        ),
      ),
    ];

    final bottomNavBar = BottomNavigationBar(
      items: bottomNavbarItem,
      onTap: onItemTapped,
      currentIndex: currentIndex,
      unselectedItemColor: kBlackColor.withOpacity(0.5),
      selectedItemColor: kBlackColor,
    );

    return Scaffold(
      body: listPage[currentIndex],
      bottomNavigationBar: bottomNavBar,
    );
  }
}
