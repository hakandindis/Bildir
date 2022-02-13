// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:react/source/pages/add_post_page.dart';
import 'package:react/source/pages/home/home_page.dart';
import 'package:react/source/pages/home/mainpage.dart';
import 'package:react/source/pages/profile_page.dart';
import 'package:react/source/pages/upload_img_page.dart';

class AppRoutes {
  static const String homePage = "/homePage";
  static const String addPostPage = "/addPostPage";
  static const String profilePage = "/profilePage";
  static const String uploadPage = "/uploadPage";
  static const String mainPage = "/mainPage";

  static Map<String, WidgetBuilder> define() {
    return {
      homePage: (context) => HomePage(),
      profilePage: (context) => ProfilePage(),
      addPostPage: (context) => AddPostPage(),
      uploadPage: (context) => UploadPage(),
      mainPage: (context) => MainPage(),
    };
  }
}
