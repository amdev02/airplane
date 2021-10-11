import 'package:flutter/material.dart';
import 'package:varana_apps/pages/users/spv_account_page.dart';
import 'package:varana_apps/pages/users/spv_dashboard.dart';
import 'package:varana_apps/pages/users/spv_lead_page.dart';
import 'package:varana_apps/pages/users/spv_sold_page.dart';
import 'package:varana_apps/pages/users/spv_visit_page.dart';
import 'package:varana_apps/theme/thema.dart';

class SpvPage extends StatefulWidget {
  const SpvPage({Key? key}) : super(key: key);

  @override
  _SpvPageState createState() => _SpvPageState();
}

class _SpvPageState extends State<SpvPage> {
  int currentIndex = 0;

  void onItemTapped(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final listPage = [
      SpvDashboard(),
      SpvLeadPage(),
      SpvVisitPage(),
      SpvSoldPage(),
      SpvAccountPage(),
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
