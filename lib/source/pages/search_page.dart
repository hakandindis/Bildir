// ignore_for_file: unused_local_variable, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:react/source/pages/home/home_page.dart';
import 'package:react/source/pages/home/tabs/search_tab.dart';
import 'package:react/source/pages/profile_page.dart';
import 'package:react/source/router/route.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> with TickerProviderStateMixin {
  late int currentIndex;

  late final TextEditingController _searchController;
  bool isVisible = false;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
    currentIndex = 1;
  }

  void onTap(int index) {
    currentIndex = index;
    if (currentIndex == 0) {
      Navigator.of(context).pushNamed(AppRoutes.mainPage);
    } else if (currentIndex == 1) {
      // Navigator.of(context).pushNamed(AppRoutes.searchPage);
    } else if (currentIndex == 2) {
      Navigator.of(context).pushNamed(AppRoutes.profilePage);
    }
  }

  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(
      length: 2,
      vsync: this,
    );

    return homePageBuild(_tabController, context);
  }

  Scaffold homePageBuild(TabController _tabController, BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   elevation: 0.1,
      //   backgroundColor: Colors.grey[100],
      //   title: Padding(
      //     padding: const EdgeInsets.only(left: 95),
      //     child: Text(
      //       "Düzelt",
      //       style: TextStyle(color: Colors.black),
      //     ),
      //   ),
      // ),
      //------------------------------------------------------------------
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     Navigator.of(context).pushNamed(AppRoutes.addPostPage);
      //   },
      //   child: Icon(Icons.add_a_photo_outlined),
      // ),
      body: homePageBuilder(_tabController),

      bottomNavigationBar: BottomNavigationBar(
        unselectedFontSize: 0,
        selectedFontSize: 0,
        iconSize: 40,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Color.fromARGB(255, 5, 17, 51),
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
        //SizedBox(height: 100),
        // Container(
        //   padding: EdgeInsets.only(top: 10),
        //   child: Align(
        //     alignment: Alignment.center,
        //     child: TabBar(
        //       labelPadding: const EdgeInsets.only(left: 20, right: 20),
        //       controller: _tabController,
        //       labelColor: Colors.black,
        //       unselectedLabelColor: Colors.grey,
        //       indicatorSize: TabBarIndicatorSize.label,
        //       isScrollable: true,
        //       indicator: CircleTabIndicator(color: Colors.redAccent, radius: 4),
        //       tabs: [
        //         Tab(text: "Aktif Sorunlar"),
        //         Tab(text: "Çözülmüş Sorunlar"),
        //       ],
        //     ),
        //   ),
        // ),
        Expanded(
          //margin: const EdgeInsets.only(top: 10),
          //width: MediaQuery.of(context).size.width,
          //height: MediaQuery.of(context).size.height,
          // child: Container(
          //   decoration: BoxDecoration(borderRadius: BorderRadius.circular(30)),
          //   child: TabBarView(
          //     controller: _tabController,
          //     children: [
          //       HomePage(),
          //       HomePage(),
          //     ],
          //   ),
          // ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(10, 80, 10, 10),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: TextField(
                    onSubmitted: (String string) {
                      isVisible = !isVisible;
                      print(isVisible.toString());
                      setState(() {});
                    },
                    controller: _searchController,
                    decoration: InputDecoration(
                      //icon: Icon(Icons.search),
                      prefixIcon: Icon(Icons.search),
                      hintText: "search",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                ),
                !isVisible
                    ? Container()
                    : Expanded(
                        //margin: const EdgeInsets.only(top: 10),
                        //width: MediaQuery.of(context).size.width,
                        //height: MediaQuery.of(context).size.height,
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30)),
                          child: SearchTab(),
                        ),
                      ),
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
