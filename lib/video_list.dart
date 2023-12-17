import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class VedioList extends StatelessWidget {
  const VedioList({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('videos').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(child: CircularProgressIndicator());
        }

        var videos = snapshot.data!.docs;

        return ListView.builder(
          itemCount: videos.length,
          itemBuilder: (context, index) {
            var video = videos[index].data() as Map<String, dynamic>;

            return ListTile(
              title: Text(video['title'] ?? 'No Title'),
              subtitle: Text(video['description'] ?? 'No Description'),
              // Add other video details as needed
            );
          },
        );
      },
    );
    ;
  }
}
