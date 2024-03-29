import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:ahhf_app/widgets/projectDetailsEventTab.dart';

import '../widgets/EventTabCards.dart';
import '../templates/animation_template.dart';

class HomePageEventScreen extends StatelessWidget {
  const HomePageEventScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('events').snapshots(),
        builder: (ctx, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              // child: CircularProgressIndicator(),
              child: LogoAnimationScreen(),
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
    ;
  }
}
