import 'package:flutter/material.dart';
import 'package:react/source/pages/home/widgets/post_card.dart';

class IlceTab extends StatefulWidget {
  const IlceTab({Key? key}) : super(key: key);

  @override
  _IlceTabState createState() => _IlceTabState();
}

class _IlceTabState extends State<IlceTab> {
  List<String> descriptions = [
    "Harmantepe sokak ışıkları birkaç gündür çalışmıyor",
    "Duvarlarda yosun var",
    "Yapraklar sokağı kirletmiş",
    "Harmantepe sokak ışıkları birkaç gündür çalışmıyor.",
  ];

  List<String> imgPaths = ["9.jpg", "10.jpg", "11.jpg", "12.jpg"];

  List<List<String>> tags = [
    ["#istanbul", "#antalya", "#ankara"],
    ["#izmir", "#antalya", "#ankara"],
    ["#trabzon", "#antalya", "#ankara"],
    ["#harmantepe", "#istanbul", "#karanlık"],
  ];

  List<int> likes = [12, 21, 8, 28];
  List<int> dislikes = [4, 8, 19, 6];
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
