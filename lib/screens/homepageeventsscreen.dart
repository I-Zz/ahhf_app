import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:ahhf_app/widgets/projectDetailsEventTab.dart';
import 'package:ahhf_app/widgets/ProjectDetailsEventTabCards.dart';

class HomePageEventScreen extends StatelessWidget {
  const HomePageEventScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(bottom: 5),
        child: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('events')
              .snapshots(),
          builder: (ctx,snapshot){
            if(snapshot.connectionState == ConnectionState.waiting){
              return Center(child: CircularProgressIndicator(),);

            }
            else if(snapshot.hasError){
              return Center(child: Text('Somthing Wrong wrong'),
              );
            }
            final EventDataList= snapshot.data!.docs;
            return  ListView.builder(
              itemCount: EventDataList.length,
              itemBuilder: (ctx, i) => ProjectDetailsEventTabCards(
                projectID: EventDataList[i]['projectID'],
                dateTime:EventDataList[i]['dateTime'] ,
                title: EventDataList[i]['title'],
                imageUrl: EventDataList[i]['imageUrl'],
                eventAddress:EventDataList[i]['venue'],
              )
            );
          },


        ),
      ),
    );
  }
}
