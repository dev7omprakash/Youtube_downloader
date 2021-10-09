// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:download_yt/screens/browse_page.dart';
import 'package:download_yt/screens/paste_link_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("YT Downloader"),
      ),
      body: index == 0 ? PastePage() : BrowsePage(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        selectedItemColor: Colors.red,
        onTap: (value) {
          setState(() {
            index = value;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.paste),
            label: 'Paste Link',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.youtube_searched_for_outlined),
            label: 'Browse Youtube',
          ),
        ],
      ),
    );
  }
}
