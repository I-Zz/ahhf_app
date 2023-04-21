import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/ProjectDetailsEvent_provider.dart';
import 'package:intl/intl.dart';

class ProjectDetailsEventTabCards extends StatelessWidget {
  const ProjectDetailsEventTabCards({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final EventItem = Provider.of<ProjectDetailsEventTabItems>(context);
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
                    image: AssetImage(
                      EventItem.image,
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
                        EventItem.title,
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
                        '${DateFormat('dd MMM yyyy').format(EventItem.EventDate)} | ${EventItem.EventTime.format(context)}',
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
                        EventItem.EventAddress,
                        style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 12,
                            color: Color(0xFF828282),
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      SizedBox(
                        height: 34,
                        width: 138,
                        child: ElevatedButton(
                          onPressed: () {},
                          child: Text(
                            'INTERESTED',
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w600,
                              fontSize: 12,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.black,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16.0))),
                        ),
                      ),
                      SizedBox(
                        height: 34,
                        width: 138,
                        child: ElevatedButton(
                          onPressed: () {},
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Text('SHARE',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.w600,
                                    fontSize: 12,
                                  )),
                              Icon(
                                Icons.share,
                                color: Colors.black,
                                size: 15,
                              )
                            ],
                          ),
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18.0),
                                  side: BorderSide(color: Colors.black))),
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
