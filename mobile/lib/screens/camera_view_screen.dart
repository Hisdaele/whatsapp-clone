import 'dart:io';

import 'package:flutter/material.dart';

class CameraViewScreen extends StatefulWidget {
  final String imagePath;

  const CameraViewScreen({Key? key, required this.imagePath}) : super(key: key);

  @override
  State<CameraViewScreen> createState() => _CameraViewScreenState();
}

class _CameraViewScreenState extends State<CameraViewScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            SizedBox.expand(
              child: Image.file(
                File(widget.imagePath),
                fit: BoxFit.cover,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.clear),
                  color: Colors.white,
                  iconSize: 30,
                ),
                Row(
                  children: [
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {

                          },
                          icon: const Icon(Icons.crop_rotate_outlined),
                          color: Colors.white,
                          iconSize: 30,
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.emoji_emotions_outlined),
                          color: Colors.white,
                          iconSize: 30,
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.title),
                          color: Colors.white,
                          iconSize: 30,
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.edit),
                          color: Colors.white,
                          iconSize: 30,
                        )
                      ],
                    ),
                  ],
                ),
              ],
            ),
            Positioned(
              bottom: 0.0,
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Card(
                        margin:
                            const EdgeInsets.only(left: 2, right: 2, bottom: 8),
                        color: Theme.of(context).primaryColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25)),
                        child: TextFormField(
                          textAlignVertical: TextAlignVertical.center,
                          keyboardType: TextInputType.multiline,
                          style: const TextStyle(
                              fontSize: 17, color: Colors.white),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Add a caption",
                            contentPadding: const EdgeInsets.all(5),
                            hintStyle: const TextStyle(
                                fontSize: 17, color: Colors.white),
                            prefixIcon: IconButton(
                              icon: const Icon(
                                Icons.add_photo_alternate,
                                color: Colors.white,
                              ),
                              onPressed: () {},
                            ),
                          ),
                          onChanged: (value) {
                            /* if(value.isNotEmpty != hasText){
                                setState(() {
                                  hasText = value.isNotEmpty;
                                });
                              }*/
                          },
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          bottom: 8.0, left: 2.0, right: 4.0),
                      child: CircleAvatar(
                        backgroundColor:Colors.teal,
                        radius: 25,
                        child: IconButton(
                          color: Colors.white,
                          icon: const Icon(Icons.check),
                          onPressed: () {},
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
