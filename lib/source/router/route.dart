import 'package:flutter/material.dart';
import 'package:react/source/pages/home/home_page.dart';
import 'package:react/source/pages/profile_page.dart';

class AppRoutes {
  static const String homePage = "/homePage";
  static const String welcomePage = "/welcomePage";
  static const String profilePage = "/profilePage";

  static Map<String, WidgetBuilder> define() {
    return {
      homePage: (context) => HomePage(),
      profilePage: (context) => ProfilePage(),
    };
  }
}
