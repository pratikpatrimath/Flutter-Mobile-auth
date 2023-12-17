import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:blackcoffer/video_recording.dart';
import 'package:blackcoffer/video_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Videos'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              // Implement search functionality
              // You can use a TextEditingController to get the search input
            },
          ),
        ],
      ),
      body: VedioList(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigate to the video recording page
          
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
