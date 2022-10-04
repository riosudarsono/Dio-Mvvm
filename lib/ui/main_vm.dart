import 'home/home_page.dart';
import 'package:flutter/material.dart';
import 'profile/profile_page.dart';
import 'package:stacked/stacked.dart';

class MainVM extends BaseViewModel {
  List<Widget> pages = <Widget>[
    const HomePage(),
    const ProfilePage(),
  ];

  int selectedIndex = 0;

  void onItemTapped(int index) {
    selectedIndex = index;
    notifyListeners();
  }

  Widget getPages() => pages.elementAt(selectedIndex);
}