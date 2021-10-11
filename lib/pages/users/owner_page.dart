import 'package:flutter/material.dart';
import 'package:varana_apps/pages/users/owner_account_page.dart';
import 'package:varana_apps/pages/users/owner_dashboard_page.dart';
import 'package:varana_apps/pages/users/owner_insight_page.dart';
import 'package:varana_apps/pages/users/owner_lead_page.dart';
import 'package:varana_apps/pages/users/owner_sold_page.dart';
import 'package:varana_apps/theme/thema.dart';

class OwnerPage extends StatefulWidget {
  const OwnerPage({Key? key}) : super(key: key);

  @override
  _OwnerPageState createState() => _OwnerPageState();
}

class _OwnerPageState extends State<OwnerPage> {
  int currentIndex = 0;

  void onItemTapped(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final listPage = [
      OwnerDashboard(),
      OwnerLeadPage(),
      OwnerSold(),
      OwnerInsight(),
      OwnerAccountPage(),
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
          "Sold",
          style: blackTextStyle,
        ),
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.bar_chart_outlined),
        title: Text(
          "Insight",
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
