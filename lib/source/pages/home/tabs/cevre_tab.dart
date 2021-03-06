import 'package:flutter/material.dart';
import 'package:react/source/pages/home/widgets/post_card.dart';

class CevreTab extends StatefulWidget {
  const CevreTab({Key? key}) : super(key: key);

  @override
  _CevreTabState createState() => _CevreTabState();
}

class _CevreTabState extends State<CevreTab> {
  List<String> descriptions = [
    "Gültepe mahallesinde sokak ışıkları birkaç gündür çalışmıyor.",
    "Kaldırım kırılmış",
    "Nurtepe mahallesinde sokak köpekleri arasında hastalanmış olanlar var ve saldırganlar.",
    "Nehrin kenarında per şişeleri var",
  ];

  List<String> imgPaths = ["5.jpg", "6.jpg", "7.jpg", "8.jpg"];

  List<List<String>> tags = [
    ["#istanbul", "#gültepe", "#belediye"],
    ["#izmir", "#antalya", "#ankara"],
    ["#istanbul", "#nurtepe", "#ibb"],
    ["#trabzon", "#antalya", "#ankara"],
  ];

  List<int> likes = [12, 13, 9, 7];
  List<int> dislikes = [3, 30, 4, 21];
  List<bool> seens = [true, true, true, false];

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
