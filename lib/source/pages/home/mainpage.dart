// ignore_for_file: unused_local_variable, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:react/source/pages/home/home_page.dart';
import 'package:react/source/pages/home/tabs/cevre_tab.dart';
import 'package:react/source/pages/home/tabs/ilce_tab.dart';
import 'package:react/source/pages/home/tabs/oneri_tab.dart';
import 'package:react/source/pages/home/tabs/sehir_tab.dart';
import 'package:react/source/pages/profile_page.dart';
import 'package:react/source/router/route.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> with TickerProviderStateMixin {
  late int currentIndex;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    currentIndex = 0;
  }

  void onTap(int index) {
    currentIndex = index;
    if (currentIndex == 0) {
      // Navigator.of(context).pushNamed(AppRoutes.mainPage);
    } else if (currentIndex == 1) {
      Navigator.of(context).pushNamed(AppRoutes.searchPage);
    } else if (currentIndex == 2) {
      Navigator.of(context).pushNamed(AppRoutes.profilePage);
    }
  }

  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(
      length: 4,
      vsync: this,
    );

    return homePageBuild(_tabController, context);
  }

  Scaffold homePageBuild(TabController _tabController, BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.1,
        backgroundColor: Colors.grey[100],
        title: Padding(
          padding: const EdgeInsets.only(left: 160),
          child: Text(
            "Bildir",
            style: TextStyle(color: Colors.black),
          ),
        ),
      ),
      body: homePageBuilder(_tabController),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed(AppRoutes.addPostPage);
        },
        child: Icon(Icons.add_a_photo_outlined),
      ),
      bottomNavigationBar: BottomNavigationBar(
        unselectedFontSize: 0,
        selectedFontSize: 0,
        iconSize: 40,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Color.fromARGB(0, 114, 196, 201),
        onTap: onTap,
        currentIndex: currentIndex,
        selectedItemColor: Color.fromARGB(137, 9, 154, 211),
        unselectedItemColor: Colors.grey.withOpacity(0.5),
        showUnselectedLabels: false,
        showSelectedLabels: false,
        elevation: 0,
        // ignore: prefer_const_literals_to_create_immutables
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: ""),
        ],
      ),
    );
  }

  Column homePageBuilder(TabController _tabController) {
    return Column(
      //crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // Padding(
        //   padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
        //   child: TextField(
        //     //controller: _searchController,
        //     decoration: InputDecoration(
        //       //icon: Icon(Icons.search),
        //       prefixIcon: Icon(Icons.search),
        //       hintText: "search",
        //       border: OutlineInputBorder(
        //         borderRadius: BorderRadius.circular(20),
        //       ),
        //     ),
        //   ),
        // ),
        Container(
          padding: EdgeInsets.only(top: 10, bottom: 10),
          child: Align(
            alignment: Alignment.centerLeft,
            child: TabBar(
              labelPadding: const EdgeInsets.only(left: 20, right: 20),
              controller: _tabController,
              labelColor: Colors.black,
              unselectedLabelColor: Colors.grey,
              indicatorSize: TabBarIndicatorSize.label,
              isScrollable: true,
              indicator: CircleTabIndicator(color: Colors.redAccent, radius: 4),
              tabs: [
                Tab(text: "Önerilenler"),
                Tab(text: "Çevrendekiler"),
                Tab(text: "İlçendekiler"),
                Tab(text: "Şehrindekiler"),
              ],
            ),
          ),
        ),
        Expanded(
          //margin: const EdgeInsets.only(top: 10),
          //width: MediaQuery.of(context).size.width,
          //height: MediaQuery.of(context).size.height,
          child: Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(30)),
            child: TabBarView(
              controller: _tabController,
              children: [
                // HomePage(),
                // HomePage(),
                // HomePage(),
                // HomePage(),
                OneriTab(),
                CevreTab(),
                IlceTab(),
                SehirTab(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class CircleTabIndicator extends Decoration {
  final Color color;
  double radius;

  CircleTabIndicator({required this.color, required this.radius});
  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _CirclePainter(color: color, radius: radius);
  }
}

class _CirclePainter extends BoxPainter {
  final Color color;
  double radius;

  _CirclePainter({required this.color, required this.radius});

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    Paint _paint = Paint();
    _paint.color = color;
    _paint.isAntiAlias = true;
    final Offset circleOffset = Offset(
      configuration.size!.width / 2 - radius / 2,
      configuration.size!.height - radius,
    );

    canvas.drawCircle(offset + circleOffset, radius, _paint);
  }
}
