import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/feedProvider.dart';
import 'package:intl/intl.dart';
import './FeedTab.dart';

class FeedTabCard extends StatefulWidget {
  const FeedTabCard({
    super.key,
  });

  @override
  State<FeedTabCard> createState() => _FeedTabCardState();
}

class _FeedTabCardState extends State<FeedTabCard> {
  @override
  Widget build(BuildContext context) {
    final EventItem = Provider.of<FeedTabItems>(context, listen: false);
    return Padding(
      padding: const EdgeInsets.only(top: 5.0, bottom: 5),
      child: Stack(
        alignment: AlignmentDirectional.bottomEnd,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10.0, bottom: 15.0),
            child: Container(
              height: 385,
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: 18),
              //padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Color.fromRGBO(0, 0, 0, 0.06),
                    blurRadius: 7,
                    spreadRadius: 6,
                    offset: Offset(0, 0),
                  ),
                ],
                color: Color(0xFFFFFFFF),
              ),
              child: Column(
                //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 20,
                      ),
                      CircleAvatar(
                        backgroundImage: AssetImage(EventItem.image),
                        radius: 20,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            EventItem.title,
                            style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontSize: 15,
                                fontWeight: FontWeight.w600),
                          ),
                          Text(EventItem.time.toString())
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 20,
                      ),
                      Container(
                        width: 300,
                        height: 69,
                        child: Text(EventItem.description),
                      ),
                      SizedBox(
                        width: 5,
                      ),

                      //  ${DateFormat('hh:mm a').format(DateTime(2022, 1, 1, EventItem.EventTime.hour, EventItem.EventTime.minute))
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 26,
                      ),
                      Image(
                        image: AssetImage(EventItem.image_text),
                        height: 203,
                        width: 294,
                      ),
                      SizedBox(
                        width: 9,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 15,
                      ),
                      IconButton(
                        iconSize: 25,
                        icon: EventItem.likes == false
                            ? Icon(Icons.favorite_border_outlined)
                            : Icon(Icons.favorite),
                        onPressed: () {
                          setState(() {
                            EventItem.likes = !EventItem.likes;
                          });
                        },
                      ),
                      Text(
                        EventItem.liked_count.toString(),
                        style: TextStyle(color: Colors.grey[600], fontSize: 13),
                      )
                    ],
                    // children: [
                    //   SizedBox(
                    //     width: 20,
                    //   ),
                    //   Icon(Icons.favorite_border_outlined, size: 20),

                    // ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
