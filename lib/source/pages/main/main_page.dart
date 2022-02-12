import 'package:flutter/material.dart';
import 'package:react/source/pages/storage_service.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final Storage storage = Storage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: storage.listFiles(),
        builder: (
          context,
          AsyncSnapshot<firebase_storage.ListResult> snapshot,
        ) {
          if (snapshot.connectionState == ConnectionState.done &&
              snapshot.hasData) {
            return FutureBuilder(
              // future: storage.downloadURL('IMG_20220212_011134.jpg'),
              future: storage.downloadURL('IMG_20220212_011134.jpg'),
              builder: (
                context,
                AsyncSnapshot<String> snapshot,
              ) {
                if (snapshot.connectionState == ConnectionState.done &&
                    snapshot.hasData) {
                  return Container(
                    width: 300,
                    height: 250,
                    child: Image.network(
                      snapshot.data!,
                      fit: BoxFit.cover,
                    ),
                  );
                }
                if (snapshot.connectionState == ConnectionState.waiting ||
                    !snapshot.hasData) {
                  return CircularProgressIndicator();
                }

                return Container();
              },
            );
          }
          if (snapshot.connectionState == ConnectionState.waiting ||
              !snapshot.hasData) {
            return CircularProgressIndicator();
          }

          return Container();
        },
      ),
    );
  }
}
