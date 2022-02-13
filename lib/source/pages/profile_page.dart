// ignore_for_file: unused_local_variable, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:react/source/pages/home/tabs/aktif_tab.dart';
import 'package:react/source/pages/home/tabs/cozum_tab.dart';
import 'package:react/source/router/route.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage>
    with TickerProviderStateMixin {
  late int currentIndex;

  @override
  void initState() {
    super.initState();
    currentIndex = 2;
  }

  void onTap(int index) {
    currentIndex = index;
    if (currentIndex == 0) {
      Navigator.of(context).pushNamed(AppRoutes.mainPage);
    } else if (currentIndex == 1) {
      Navigator.of(context).pushNamed(AppRoutes.searchPage);
    } else if (currentIndex == 2) {
      // Navigator.of(context).pushNamed(AppRoutes.profilePage);
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
      appBar: AppBar(
        elevation: 0.1,
        backgroundColor: Colors.grey[100],
        title: Padding(
          padding: const EdgeInsets.only(left: 95),
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
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: ""),
        ],
      ),
    );
  }

  Widget homePageBuilder(TabController _tabController) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(15),
          margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
          //width: MediaQuery.of(context).size.width,
          //height: MediaQuery.of(context).size.height * 0.2,
          decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              //bottom right shadow is darker
              BoxShadow(
                color: Colors.grey.shade500,
                offset: Offset(4, 4),
                blurRadius: 15,
                spreadRadius: 1,
              ),
              //top left shadow is lighter
              BoxShadow(
                color: Colors.white,
                offset: Offset(-4, -4),
                blurRadius: 15,
                spreadRadius: 1,
              ),
            ],
          ),
          child: Row(
            children: [
              // Expanded(
              //   child: CircleAvatar(
              //     child: Icon(Icons.person),
              //     backgroundColor: Colors.grey[100],
              //   ),
              // ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text("Antalya / Kepez"),
                      SizedBox(width: 10),
                      Icon(Icons.location_on_outlined),
                      SizedBox(width: 20),
                      Text("Ankara / Ulus"),
                      SizedBox(width: 10),
                      Icon(Icons.location_on_outlined),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 10),
          padding: EdgeInsets.only(top: 10),
          child: Align(
            alignment: Alignment.center,
            child: TabBar(
              labelPadding: const EdgeInsets.only(left: 20, right: 20),
              controller: _tabController,
              labelColor: Colors.black,
              unselectedLabelColor: Colors.grey,
              indicatorSize: TabBarIndicatorSize.label,
              isScrollable: true,
              indicator: CircleTabIndicator(color: Colors.redAccent, radius: 4),
              tabs: [
                Tab(text: "Aktif Sorunlar"),
                Tab(text: "Çözülmüş Sorunlar"),
              ],
            ),
          ),
        ),
        Expanded(
          //margin: const EdgeInsets.only(top: 10),
          //width: MediaQuery.of(context).size.width,
          //height: MediaQuery.of(context).size.height,
          child: Container(
            margin: const EdgeInsets.only(top: 10),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(30)),
            child: TabBarView(
              controller: _tabController,
              children: [
                AktifTab(),
                CozumTab(),
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

// // ignore_for_file: prefer_const_constructors

// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';

// class ProfilePage extends StatefulWidget {
//   const ProfilePage({Key? key}) : super(key: key);

//   @override
//   _ProfilePageState createState() => _ProfilePageState();
// }

// class _ProfilePageState extends State<ProfilePage> {
//   File? _pickedImage;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           GestureDetector(
//             onTap: getImage,
//             child: CircleAvatar(
//               radius: 40,
//               backgroundColor: Colors.grey,
//               backgroundImage:
//                   _pickedImage != null ? FileImage(_pickedImage!) : null,
//               child: _pickedImage != null
//                   ? Container()
//                   : const Icon(
//                       Icons.photo,
//                       color: Colors.white,
//                     ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Future getImage()          async {
//     var pickImage = await ImagePicker().pickImage(
//       source: ImageSource.gallery,
//     );

//     setState(() {
//       _pickedImage = File(pickImage!.path);
//     });
//   }
// }
