import 'package:ahhf_app/widgets/EventTabCards.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class projectDetailsEventsTab extends StatelessWidget {
  final String projectID;
  projectDetailsEventsTab({required this.projectID});

  @override
  Widget build(BuildContext context) {
    // I have added this provider listener to listen the changes in Events Items List
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('events')
            .where('projectID', isEqualTo: projectID)
            .snapshots(),
        builder: (ctx, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Somthing Wrong wrong'),
            );
          }
          final EventDataList = snapshot.data!.docs;
          return ListView.builder(
              itemCount: EventDataList.length,
              itemBuilder: (ctx, i) => EventTabCards(
                    dateTime: EventDataList[i]['dateTime'],
                    imageUrl: EventDataList[i]['imageUrl'],
                    title: EventDataList[i]['title'],
                    EventVenue: EventDataList[i]['venue'],
                  ));
        },
      ),
    );
  }
}
