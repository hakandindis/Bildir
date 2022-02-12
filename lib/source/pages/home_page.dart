// // ignore_for_file: prefer_const_constructors

// import 'package:flutter/material.dart';
// import 'package:react/source/router/route.dart';

// class HomePage extends StatefulWidget {
//   const HomePage({Key? key}) : super(key: key);

//   @override
//   _HomePageState createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
//   late final TextEditingController _searchController;

//   final tabColors = [
//     Colors.amber,
//     Colors.red,
//     Colors.green,
//     Colors,
//     Colors.black
//   ];

//   int currentIndex = 0;

//   void onTap(int index) {
//     setState(() {
//       currentIndex = index;
//     });
//   }

//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     _searchController = TextEditingController();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final Map<String, dynamic>? arguments =
//         ModalRoute.of(context)!.settings.arguments != null
//             ? ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>
//             : null;

//     TabController _tabController = TabController(
//       length: 4,
//       vsync: this,
//     );

//     return Scaffold(
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           Navigator.of(context).pushNamed(AppRoutes.addPostPage);
//         },
//         child: Icon(Icons.add_a_photo_outlined),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.fromLTRB(10, 30, 10, 10),
//         child: Column(
//           children: [
//             TextField(
//               controller: _searchController,
//               decoration: InputDecoration(
//                 //icon: Icon(Icons.search),
//                 prefixIcon: Icon(Icons.search),
//                 hintText: "search",
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(20),
//                 ),
//               ),
//             ),
//             Container(
//               padding: EdgeInsets.only(top: 10),
//               child: Align(
//                 alignment: Alignment.centerLeft,
//                 child: TabBar(
//                   labelPadding: const EdgeInsets.only(left: 20, right: 20),
//                   controller: _tabController,
//                   labelColor: Colors.black,
//                   unselectedLabelColor: Colors.grey,
//                   indicatorSize: TabBarIndicatorSize.label,
//                   isScrollable: true,
//                   indicator:
//                       CircleTabIndicator(color: Colors.redAccent, radius: 4),
//                   tabs: [
//                     Tab(text: "Ana Sayfa"),
//                     Tab(text: "Yakın Çevre"),
//                     Tab(text: "Şehrindekiler"),
//                     Tab(text: "Ülkendekiler"),
//                   ],
//                 ),
//               ),
//             ),
//             Container(
//               margin: const EdgeInsets.only(top: 10),
//               width: MediaQuery.of(context).size.width,
//               height: MediaQuery.of(context).size.height * 0.7,
//               decoration: BoxDecoration(color: Colors.redAccent),
//               child: TabBarView(
//                 controller: _tabController,
//                 children: [
//                   ListView.builder(
//                     itemCount: 3,
//                     scrollDirection: Axis.vertical,
//                     itemBuilder: (BuildContext context, int index) {
//                       return Container(
//                         margin: const EdgeInsets.fromLTRB(10, 0, 10, 30),
//                         //width: 200,
//                         height: 300,
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(20),
//                           color: Colors.white,
//                           image: arguments == null
//                               ? DecorationImage(
//                                   image: AssetImage("img/welcome-two.png"),
//                                   fit: BoxFit.cover,
//                                 )
//                               : DecorationImage(
//                                   image: FileImage(arguments['file']),
//                                   fit: BoxFit.cover,
//                                 ),
//                         ),
//                         child: arguments == null
//                             ? Text("XXX")
//                             : Text(arguments['description']),
//                       );
//                     },
//                   ),
//                   ListView.builder(
//                     itemCount: 3,
//                     scrollDirection: Axis.vertical,
//                     itemBuilder: (BuildContext context, int index) {
//                       return Container(
//                         margin: const EdgeInsets.only(right: 10),
//                         width: 200,
//                         height: 300,
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(20),
//                           color: Colors.black,
//                           // image: DecorationImage(
//                           //   image: AssetImage("img/welcome-two.png"),
//                           //   fit: BoxFit.cover,
//                           // ),
//                         ),
//                       );
//                     },
//                   ),
//                   ListView.builder(
//                     itemCount: 3,
//                     scrollDirection: Axis.vertical,
//                     itemBuilder: (BuildContext context, int index) {
//                       return Container(
//                         margin: const EdgeInsets.only(right: 10),
//                         width: 200,
//                         height: 300,
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(20),
//                           color: Colors.black,
//                           // image: DecorationImage(
//                           //   image: AssetImage("img/welcome-two.png"),
//                           //   fit: BoxFit.cover,
//                           // ),
//                         ),
//                       );
//                     },
//                   ),
//                   ListView.builder(
//                     itemCount: 3,
//                     scrollDirection: Axis.vertical,
//                     itemBuilder: (BuildContext context, int index) {
//                       return Container(
//                         margin: const EdgeInsets.only(right: 10),
//                         width: 200,
//                         height: 300,
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(20),
//                           color: Colors.black,
//                           // image: DecorationImage(
//                           //   image: AssetImage("img/welcome-two.png"),
//                           //   fit: BoxFit.cover,
//                           // ),
//                         ),
//                       );
//                     },
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         unselectedFontSize: 0,
//         selectedFontSize: 0,
//         iconSize: 40,
//         type: BottomNavigationBarType.fixed,
//         backgroundColor: Color.fromARGB(255, 5, 17, 51),
//         onTap: onTap,
//         currentIndex: currentIndex,
//         selectedItemColor: Color.fromARGB(137, 9, 154, 211),
//         unselectedItemColor: Colors.grey.withOpacity(0.5),
//         showUnselectedLabels: false,
//         showSelectedLabels: false,
//         elevation: 0,
//         // ignore: prefer_const_literals_to_create_immutables
//         items: [
//           BottomNavigationBarItem(icon: Icon(Icons.apps), label: ""),
//           BottomNavigationBarItem(icon: Icon(Icons.bar_chart_sharp), label: ""),
//         ],
//       ),
//     );
//   }
// }

// class CircleTabIndicator extends Decoration {
//   final Color color;
//   double radius;

//   CircleTabIndicator({required this.color, required this.radius});
//   @override
//   BoxPainter createBoxPainter([VoidCallback? onChanged]) {
//     return _CirclePainter(color: color, radius: radius);
//   }
// }

// class _CirclePainter extends BoxPainter {
//   final Color color;
//   double radius;

//   _CirclePainter({required this.color, required this.radius});

//   @override
//   void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
//     Paint _paint = Paint();
//     _paint.color = color;
//     _paint.isAntiAlias = true;
//     final Offset circleOffset = Offset(
//       configuration.size!.width / 2 - radius / 2,
//       configuration.size!.height - radius,
//     );

//     canvas.drawCircle(offset + circleOffset, radius, _paint);
//   }
// }
