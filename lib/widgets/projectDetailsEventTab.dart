import 'package:ahhf_app/provider/ProjectDetailsEvent_provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/ProjectDetailsEventTabCards.dart';

class projectDetailsEventsTab extends StatelessWidget {
 final String projectID;
 projectDetailsEventsTab({required this.projectID});

  @override
  Widget build(BuildContext context) {
    // I have added this provider listener to listen the changes in Events Items List

    //final EventTabItems = Provider.of<ProjectDetailsEventTabProvider>(context);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(bottom: 5),
        child: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('events')
              .where('projectID',isEqualTo: projectID)
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
