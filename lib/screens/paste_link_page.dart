// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:download_yt/screens/download.dart';

class PastePage extends StatefulWidget {
  const PastePage({Key? key}) : super(key: key);

  @override
  _PastePageState createState() => _PastePageState();
}

class _PastePageState extends State<PastePage> {
  bool tap = false;
  TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              Container(
                  child: Image(
                      height: 200,
                      width: 200,
                      image: AssetImage("image/icon.png"))),
              Container(
                height: 75,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(width: 1.0, color: Colors.red)),
                child: TextFormField(
                  controller: _controller,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    labelText: "Paste Video Link",
                    alignLabelWithHint: true,
                    fillColor: Colors.red,
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              MaterialButton(
                onPressed: () {
                  if (_controller.text.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("No link pasted")));
                  } else {
                    Download().downloadVideo(
                        _controller.text.trim(), "Downloading..");
                  }
                },
                color: Colors.red,
                minWidth: double.infinity,
                height: 50,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.download,
                      color: Colors.black54,
                      size: 25,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Download",
                      style: TextStyle(color: Colors.black54, fontSize: 18),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
