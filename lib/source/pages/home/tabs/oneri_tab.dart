import 'package:flutter/material.dart';
import 'package:react/source/pages/home/widgets/post_card.dart';

class OneriTab extends StatefulWidget {
  const OneriTab({Key? key}) : super(key: key);

  @override
  _OneriTabState createState() => _OneriTabState();
}

class _OneriTabState extends State<OneriTab> {
  List<String> descriptions = [
    "Kepez ilçesi 2617 sokaktaki mazgallar tıkalı",
    "Çünürde lağım kokusu var. Çevreye zarar veriyor.",
    "CCC",
    "DDD",
  ];

  List<String> imgPaths = ["1.jpg", "2.jpg", "3.jpg", "4.jpg"];

  List<List<String>> tags = [
    ["#kepez", "#antalya", "#2617sokak"],
    ["#izmir", "#antalya", "#ankara"],
    ["#trabzon", "#antalya", "#ankara"],
    ["#trabzon", "#antalya", "#ankara"],
    ["#trabzon", "#antalya", "#ankara"],
  ];

  List<int> likes = [12, 21, 8, 28];
  List<int> dislikes = [3, 8, 4, 6];

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
            ),
          );
        },
      ),
    );
  }
}
