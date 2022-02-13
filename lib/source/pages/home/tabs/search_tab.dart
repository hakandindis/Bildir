// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:react/source/pages/home/widgets/post_card.dart';

class SearchTab extends StatefulWidget {
  const SearchTab({Key? key}) : super(key: key);

  @override
  _SearchTabState createState() => _SearchTabState();
}

class _SearchTabState extends State<SearchTab> {
  List<String> descriptions = [
    "Mazgallar tıkalı",
    "Saldırgan köpekler var",
    "yosun tutmuş",
    "Etrafta kötü bir koku var",
  ];

  List<String> imgPaths = ["3.jpg", "7.jpg", "10.jpg", "11.jpg"];

  List<List<String>> tags = [
    ["#istanbul", "#antalya", "#ankara"],
    ["#izmir", "#antalya", "#ankara"],
    ["#trabzon", "#antalya", "#ankara"],
    ["#trabzon", "#antalya", "#ankara"],
    ["#trabzon", "#antalya", "#ankara"],
  ];

  List<int> likes = [12, 21, 13, 21];
  List<int> dislikes = [3, 8, 4, 6];
  List<bool> seens = [true, false, true, false];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: 4,
        itemBuilder: (context, index) {
          return Container(
            padding: EdgeInsets.all(10),
            //height: MediaQuery.of(context).size.height * 0.7,
            //width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(30)),
            child: PostCard(
              index: index,
              description: descriptions[index],
              imagePath: imgPaths[index],
              tags: tags[index],
              like: likes[index],
              dislike: dislikes[index],
              isSeen: seens[index],
            ),
          );
        },
      ),
    );
  }
}
