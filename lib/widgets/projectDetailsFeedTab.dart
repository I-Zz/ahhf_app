
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'FeedTabCard.dart';

class projectDetailsFeedTab extends StatefulWidget {
  final String projectID;
  projectDetailsFeedTab({required this.projectID});

  @override
  State<projectDetailsFeedTab> createState() => _projectDetailsFeedTabState();
}

class _projectDetailsFeedTabState extends State<projectDetailsFeedTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('feeds').where('projectID',isEqualTo:widget.projectID )
            .snapshots(),
        builder: (ctx,snapshot){
          if(snapshot.connectionState == ConnectionState.waiting){
            return Center(child: CircularProgressIndicator(),);

          }
          else if(snapshot.hasError){
            return Center(child: Text('Somthing Wrong wrong'),
            );
          }
          final FeedDataList= snapshot.data!.docs;
          return  ListView.builder(
            itemCount: FeedDataList.length,
            itemBuilder: (ctx, i) => FeedTabCard(
              feedID:FeedDataList[i].id,
              likes:FeedDataList[i]['likes'] ,
              totalLikes: FeedDataList[i]['totalLikes'],
              dateTime: FeedDataList[i]['dateTime'],
              description: FeedDataList[i]['description'],
              imageUrl: FeedDataList[i]['imageUrl'].toString(),
            ),
          );
        },


      ),
    );
  }
}
