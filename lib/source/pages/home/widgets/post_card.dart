// ignore_for_file: prefer_const_constructors

import 'dart:io';

import 'package:flutter/material.dart';

class PostCard extends StatefulWidget {
  PostCard({
    Key? key,
    this.imageFile,
    this.imagePath,
    this.description,
    this.tags,
    this.index,
  }) : super(key: key);

  File? imageFile;
  String? imagePath;
  String? description;
  List<String>? tags;
  int? index;

  @override
  _PostCardState createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.5,
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
      child: Stack(
        children: [
          widget.imageFile != null
              ? Image.file(widget.imageFile!,
                  fit: BoxFit.cover, height: 200, width: 200)
              : Image.asset(widget.imagePath!,
                  fit: BoxFit.cover, height: 200, width: 200),
          // CircleAvatar(backgroundImage: AssetImage(widget.imagePath!)),
          Row(
            children: [
              Text(
                widget.description!,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(widget.tags![widget.index!]),
            ],
          ),
        ],
      ),
    );
  }
}
