// ignore_for_file: prefer_const_constructors

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:react/source/router/route.dart';

class AddPostPage extends StatefulWidget {
  const AddPostPage({Key? key}) : super(key: key);
  // final Function(String filePath, String decription, List<String> tags)
  //     callback;

  @override
  _AddPostPageState createState() => _AddPostPageState();
}

class _AddPostPageState extends State<AddPostPage> {
  File? _pickedImage;
  late final TextEditingController _descriptionController;
  late final TextEditingController _tagController;
  bool isAdd = false;
  bool _enable = true;

  List<String> tags = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _descriptionController = TextEditingController();
    _tagController = TextEditingController();
  }

  Future pickImage() async {
    var pickImage = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );

    setState(() {
      _pickedImage = File(pickImage!.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    print("post build method executed");
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          //padding: const EdgeInsets.all(50),
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
          child: SingleChildScrollView(
            child: Column(
              children: [
                _pickedImage == null
                    ? Padding(
                        padding: const EdgeInsets.only(top: 100),
                        child: TextButton(
                          onPressed: pickImage,
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(width: 1),
                                borderRadius: BorderRadius.circular(12)),
                            child: Text(
                              "Fotoğraf seçiniz",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 30),
                            ),
                          ),
                        ),
                      )
                    : Container(
                        margin: const EdgeInsets.all(10),
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 0.4,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            image: FileImage(_pickedImage!),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: _descriptionController,
                    decoration: InputDecoration(
                      // icon: Icon(Icons.search),
                      prefixIcon: Icon(Icons.search),
                      labelText: "açıklama",
                      hintText: "Açıklama giriniz",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: _tagController,
                    decoration: InputDecoration(
                      //enabled: _enable,
                      icon: IconButton(
                          onPressed: () {
                            tags.add(_tagController.text);
                            _tagController.text = "";
                            //_enable = !_enable;
                            setState(() {});
                          },
                          icon: Icon(Icons.add)),
                      //prefixIcon: Icon(Icons.search),
                      labelText: "açıklama",
                      hintText: "Açıklama giriniz",
                      border: UnderlineInputBorder(),
                    ),
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.08,
                  child: ListView.builder(
                    itemCount: tags.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Text("#${tags[index]} ");
                    },
                  ),
                ),
                Row(
                  children: [
                    Spacer(),
                    Container(
                      margin: const EdgeInsets.only(right: 20),
                      decoration: BoxDecoration(
                        // color: Color.fromARGB(255, 214, 37, 37),
                        color: Colors.black12,
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
                      child: TextButton(
                        onPressed: () {
                          Navigator.pushReplacementNamed(
                              context, AppRoutes.mainPage,
                              arguments: {
                                "file": _pickedImage,
                                "description": _descriptionController.text,
                                "tags": tags,
                              });
                        },
                        child: Text("Paylaş"),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
