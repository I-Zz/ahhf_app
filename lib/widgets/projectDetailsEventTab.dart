import 'package:ahhf_app/provider/ProjectDetailsEvent_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/ProjectDetailsEventTabCards.dart';
class projectDetailsEventsTab extends StatelessWidget {
  const projectDetailsEventsTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // I have added this provider listener to listen the changes in Events Items List

    final EventTabItems=Provider.of<ProjectDetailsEventTabProvider>(context);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 20.0,bottom: 5),
        child: ListView.builder(
          itemCount: EventTabItems.items.length,
          itemBuilder:(ctx,i)=> ChangeNotifierProvider.value(   // provider is added to so that to listen changes in each single  EventItem in case of data changes
            value: EventTabItems.items[i],
            child: ProjectDetailsEventTabCards(),
          ),
    ),
      )
    );
  }
}
