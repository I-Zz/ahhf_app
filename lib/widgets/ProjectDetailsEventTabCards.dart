import 'dart:ffi';

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
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Stack(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 18, vertical: 18),
            height: 287,
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
            padding: const EdgeInsets.only(top: 150.0),
            child: Container(
              height: 137,
              width: double.infinity,
              margin: EdgeInsets.all(18),
              padding: EdgeInsets.all(10),
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
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
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
