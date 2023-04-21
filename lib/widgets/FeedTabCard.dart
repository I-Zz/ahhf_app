import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/feedProvider.dart';
import 'package:ahhf_app/utilities/Utilities.dart';
import './FeedTab.dart';

class FeedTabCard extends StatefulWidget {
  final String feedID;
  final String dateTime;
  final String imageUrl;
  final String description;
  int totalLikes;
  bool likes;

  FeedTabCard({
    required this.feedID,
    required this.totalLikes,
    required this.imageUrl,
    required this.dateTime,
    required this.description,
    required this.likes,
  });

  @override
  State<FeedTabCard> createState() => _FeedTabCardState();
}

class _FeedTabCardState extends State<FeedTabCard> {
  CollectionReference feedcollectionref =
      FirebaseFirestore.instance.collection('feeds');

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5.0, bottom: 5),
      child: Stack(
        alignment: AlignmentDirectional.bottomEnd,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10.0, bottom: 15.0),
            child: Container(
              // height: 385,
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
                        backgroundImage: AssetImage('assets/images/logo.png'),
                        radius: 20,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'AHHF',
                            style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontSize: 15,
                                fontWeight: FontWeight.w600),
                          ),
                          Text(Utilites.dateformat(widget.dateTime)),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  // Row(
                  //   children: [
                  //     SizedBox(
                  //       width: 20,
                  //     ),
                  //     Container(
                  //       width: 300,
                  //       height: 69,
                  //       child: Text(widget.description),
                  //     ),
                  //     SizedBox(
                  //       width: 5,
                  //     ),

                  //     //  ${DateFormat('hh:mm a').format(DateTime(2022, 1, 1, EventItem.EventTime.hour, EventItem.EventTime.minute))
                  //   ],
                  // ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    // width: 300,
                    // height: 69,

                    child: Text(widget.description),
                    // child: Text(
                    //     "The future of India lies in its villages - Mahatma Gandhi. AHHF is here with its 'Tribal and Rural Areas Education Project'. Stay Tuned! Together we can!."),
                  ),
                  SizedBox(height: 10),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: Image(
                      image: NetworkImage(widget.imageUrl),

                      // height: 203,
                      // width: 100,
                      // width: double.infinity,
                      // width: double.maxFinite,
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                  // Row(
                  //   children: [
                  //     SizedBox(
                  //       width: 26,
                  //     ),
                  //     Image(
                  //       image: NetworkImage(widget.imageUrl),
                  //       // height: 203,
                  //       // width: double.infinity,
                  //       // width: double.maxFinite,
                  //       fit: BoxFit.fitWidth,
                  //     ),
                  //     SizedBox(
                  //       width: 9,
                  //     ),
                  //   ],
                  // ),
                  Row(
                    children: [
                      SizedBox(
                        width: 15,
                      ),
                      IconButton(
                        iconSize: 25,
                        icon: widget.likes
                            ? Icon(Icons.favorite, color: Colors.red)
                            : Icon(Icons.favorite_border_outlined),
                        onPressed: () async {
                          setState(() {
                            if (widget.likes) {
                              widget.likes = false;
                              widget.totalLikes--;
                            } else {
                              widget.likes = true;
                              widget.totalLikes++;
                            }
                          });
                          await feedcollectionref.doc(widget.feedID).update({
                            'totalLikes': widget.totalLikes,
                            'likes': widget.likes
                          });
                        },
                      ),
                      Text(
                        widget.totalLikes.toString(),
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
