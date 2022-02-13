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
    this.like,
    this.dislike,
  }) : super(key: key);

  File? imageFile;
  String? imagePath;
  String? description;
  List<String>? tags;
  int? index;
  int? like;
  int? dislike;

  @override
  _PostCardState createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      //width: MediaQuery.of(context).size.width,
      // height: MediaQuery.of(context).size.height * 0.5,
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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          widget.imageFile != null
              ? Image.file(widget.imageFile!,
                  fit: BoxFit.fitWidth, height: 200, width: 200)
              : Container(
                  height: MediaQuery.of(context).size.height * 0.3,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(12),
                        topRight: Radius.circular(12)),
                    image: DecorationImage(
                      image: AssetImage("img/${widget.imagePath!}"),
                      fit: BoxFit.cover,
                    ),
                  ),
                  // child: Image.asset(
                  //   "img/${widget.imagePath!}",
                  //   fit: BoxFit.cover,
                  //   height: MediaQuery.of(context).size.height * 0.5,
                  // ),
                ),
          // CircleAvatar(backgroundImage: AssetImage(widget.imagePath!)),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.remove_red_eye_outlined,
                          size: 30,
                        ),
                        SizedBox(width: 5),
                        Text(widget.like.toString()),
                      ],
                    ),
                    Row(
                      children: [
                        Text(widget.dislike.toString()),
                        SizedBox(width: 5),
                        Icon(
                          Icons.do_disturb_on_outlined,
                          size: 30,
                        ),
                      ],
                    ),
                  ],
                ),
                Text(
                  widget.description!,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(widget.tags![0] + " "),
                    Spacer(),
                    Text(widget.tags![1] + " "),
                    Spacer(),
                    Text(widget.tags![2] + " "),
                    Spacer(),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // IconButton(
                      //   onPressed: () {},
                      //   icon: Icon(Icons.access_alarms, size: 30),
                      // ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.location_on_outlined, size: 30),
                      ),
                      // IconButton(
                      //   onPressed: () {},
                      //   icon: Icon(Icons.accessibility_outlined, size: 30),
                      // ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
