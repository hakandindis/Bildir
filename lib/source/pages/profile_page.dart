// ignore_for_file: prefer_const_constructors

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  File? _pickedImage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: getImage,
            child: CircleAvatar(
              radius: 40,
              backgroundColor: Colors.grey,
              backgroundImage:
                  _pickedImage != null ? FileImage(_pickedImage!) : null,
              child: _pickedImage != null
                  ? Container()
                  : const Icon(
                      Icons.photo,
                      color: Colors.white,
                    ),
            ),
          ),
        ],
      ),
    );
  }

  Future getImage() async {
    var pickImage = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );

    setState(() {
      _pickedImage = File(pickImage!.path);
    });
  }
}
