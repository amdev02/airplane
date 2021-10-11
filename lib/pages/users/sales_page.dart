import 'package:flutter/material.dart';
import 'package:varana_apps/pages/sales_account_page.dart';
import 'package:varana_apps/pages/sales_dashboard_page.dart';
import 'package:varana_apps/pages/sales_lead_page.dart';
import 'package:varana_apps/pages/sales_sold_page.dart';
import 'package:varana_apps/pages/sales_visit_dart.dart';
import 'package:varana_apps/theme/thema.dart';

class SalesPage extends StatefulWidget {
  @override
  _SalesPageState createState() => _SalesPageState();
}

class _SalesPageState extends State<SalesPage> {
  int currentIndex = 0;

  void onItemTapped(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final listPage = [
      DashboardSales(),
      LeadSales(),
      VisitSales(),
      SoldSales(),
      AccountSales(),
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
