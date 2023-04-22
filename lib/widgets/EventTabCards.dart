import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class EventTabCards extends StatelessWidget {
  final String imageUrl;
  final String dateTime;
  final String EventVenue;
  final String title;

  EventTabCards({
    required this.dateTime,
    required this.imageUrl,
    required this.title,
    required this.EventVenue,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15.0, bottom: 5),
      child: Stack(
        alignment: AlignmentDirectional.bottomEnd,
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 18, vertical: 1),
            height: 350,
            width: double.infinity,
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
                image: DecorationImage(
                    image: NetworkImage(
                      imageUrl,
                    ),
                    fit: BoxFit.cover)),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 140.0),
            child: Container(
              height: 147,
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
                      Text(
                        title,
                        style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 15,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 26,
                      ),
                      Icon(
                        Icons.calendar_month_outlined,
                        size: 14,
                        color: Color(0xFF828282),
                      ),
                      SizedBox(
                        width: 9,
                      ),

                      //  ${DateFormat('hh:mm a').format(DateTime(2022, 1, 1, EventItem.EventTime.hour, EventItem.EventTime.minute))
                      Text(
                        dateTime,
                        style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 12,
                            color: Color(0xFF828282),
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 26,
                      ),
                      Icon(
                        Icons.location_on_outlined,
                        size: 14,
                        color: Color(0xFF828282),
                      ),
                      SizedBox(
                        width: 9,
                      ),
                      Text(
                        EventVenue,
                        style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 12,
                            color: Color(0xFF828282),
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      SizedBox(
                        height: 34,
                        width: 138,
                        child: ElevatedButton(
                          onPressed: () {
                            showModalBottomSheet<dynamic>(
                              context: context,
                              builder: (context) => BottomSheetWidget(),
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(20),
                                ),
                              ),
                              constraints: BoxConstraints.loose(
                                Size(MediaQuery.of(context).size.width,
                                    MediaQuery.of(context).size.height * 0.25),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.black,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16.0))),
                          child: const Text(
                            'INTERESTED',
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w600,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 34,
                        width: 138,
                        child: ElevatedButton(
                          onPressed: () async {
                            const donationWebLink =
                                'https://pages.razorpay.com/ahhf-donation';
                            final text =
                                "AHHF is conducting a $title event. \n\nVenue: $EventVenue \nDate-Time: $dateTime \nJoin and Help us make it a Success! \n\nDonate here: $donationWebLink";
                            await Share.share(text);
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18.0),
                                  side: BorderSide(color: Colors.black))),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: const <Widget>[
                              Text(
                                'SHARE',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12,
                                ),
                              ),
                              Icon(
                                Icons.share,
                                color: Colors.black,
                                size: 15,
                              )
                            ],
                          ),
                        ),
                      )
                    ],
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

class BottomSheetWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 100,
            height: 5,
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
          ),
          const Divider(),
          Text(
            'Contact Details:',
            style: TextStyle(
              fontFamily: 'Montserrat',
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Divider(),
          Row(
            children: [
              Icon(Icons.call),
              const SizedBox(width: 15),
              Text(
                'Contact Number: ',
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 15,
                  // fontWeight: FontWeight.bold,
                ),
              ),
              TextButton(
                onPressed: () {
                  const number = '+919423917738';
                  launch('tel://$number');
                },
                child: Text(
                  '+91 94239 17738',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          const Divider(),
          Row(
            children: [
              Icon(Icons.email),
              const SizedBox(width: 15),
              Text(
                'Email: ',
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 15,
                  // fontWeight: FontWeight.bold,
                ),
              ),
              TextButton(
                onPressed: () {
                  const email = 'hi@approach.org.in';
                  launch('mailto:$email');
                },
                child: Text(
                  'hi@approach.org.in',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
