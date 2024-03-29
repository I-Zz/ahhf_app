import 'package:ahhf_app/provider/feedProvider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/FeedTabCard.dart';
import '../templates/animation_template.dart';

class feedTab extends StatelessWidget {
  const feedTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // I have added this provider listener to listen the changes in Events Items List

    // final FeedTabItems = Provider.of<FeedTabProvider>(context);
    // print('${FeedTabItems.feeds.length} THSIDF');

    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('feeds').snapshots(),
        builder: (ctx, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              // child: CircularProgressIndicator(),
              child: LogoAnimationScreen(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Somthing Wrong'),
            );
          }
          final FeedDataList = snapshot.data!.docs;
          return ListView.builder(
            itemCount: FeedDataList.length,
            itemBuilder: (ctx, i) => FeedTabCard(
              feedID: FeedDataList[i].id,
              likes: FeedDataList[i]['likes'],
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
