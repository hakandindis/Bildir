// ignore_for_file: avoid_returning_null_for_void, avoid_print

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:react/source/pages/storage_service.dart';

import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class UploadPage extends StatefulWidget {
  const UploadPage({Key? key}) : super(key: key);

  @override
  _UploadPageState createState() => _UploadPageState();
}

class _UploadPageState extends State<UploadPage> {
  final Storage storage = Storage();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () async {
              final results = await FilePicker.platform.pickFiles(
                allowMultiple: false,
                type: FileType.custom,
                allowedExtensions: ['png', 'jpg'],
              );

              if (results == null) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("no File selected"),
                  ),
                );

                return null;
              }

              final path = results.files.single.path!;
              final fileName = results.files.single.name;
              print(path);
              print(fileName);
              storage.uploadFile(path, fileName).then((value) => print("done"));
            },
            child: Text("Upload Image"),
          ),
          FutureBuilder(
            future: storage.listFiles(),
            builder: (
              context,
              AsyncSnapshot<firebase_storage.ListResult> snapshot,
            ) {
              if (snapshot.connectionState == ConnectionState.done &&
                  snapshot.hasData) {
                return Container(
                  height: 100,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: snapshot.data!.items.length,
                    itemBuilder: (context, index) {
                      return ElevatedButton(
                        onPressed: () {},
                        child: Text(snapshot.data!.items[index].name),
                      );
                    },
                  ),
                );
              }
              if (snapshot.connectionState == ConnectionState.waiting ||
                  !snapshot.hasData) {
                return CircularProgressIndicator();
              }

              return Container();
            },
          ),
          FutureBuilder(
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
          ),
        ],
      ),
    );
  }
}
