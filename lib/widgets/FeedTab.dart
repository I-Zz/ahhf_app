import 'package:ahhf_app/provider/feedProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/FeedTabCard.dart';

class feedTab extends StatelessWidget {
  const feedTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // I have added this provider listener to listen the changes in Events Items List

    final EventTabItems = Provider.of<FeedTabProvider>(context);

    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: ListView.builder(
        itemCount: EventTabItems.items.length,
        itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
          // provider is added to so that to listen changes in each single  EventItem in case of data changes
          value: EventTabItems.items[i],
          child: FeedTabCard(),
        ),
      ),
    ));
  }
}
