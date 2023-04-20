import 'dart:math';

import 'package:ahhf_app/provider/project.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';


class projectDetailsOverviewTab extends StatelessWidget {
  final String projectID;
  final AllProjects allprojects;
  projectDetailsOverviewTab({required this.projectID,required this.allprojects});

  @override
  Widget build(BuildContext context) {

    String formatNumber(num number) {
      if (number >= 10000000) {
        return (number / 10000000).toStringAsFixed(0) + ' Cr';
      } else if (number >= 100000) {
        return (number / 100000).toStringAsFixed(0) + ' L';
      } else if (number >= 1000) {
        return (number / 1000).toStringAsFixed(0) + ' K';
      } else {
        return number.toString();
      }
    }

    final currentProject=allprojects.getProject(projectID);
        return Scaffold(
          backgroundColor: Color.fromRGBO(245, 245, 245, 1),

          //padding: const EdgeInsets.all(20),

          body: Column(
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                //mainAxisAlignment: MainAxisAlignment.spaceAround,

                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: Container(
                      width: MediaQuery.of(context).size.width-50 ,
                      child: Text(
                          currentProject.longDescription1,
                        style: TextStyle(
                          color: Color.fromRGBO(130, 130, 130, 1),
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Montserrat',
                        ),
                      ),
                    ),
                  ),
                  //Container(

                  //),
                  SizedBox(
                    width: 20,
                    height: 10,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width-50,
                    child: Text(
                     currentProject.longDescription2,
                      style: TextStyle(
                        color: Color.fromRGBO(130, 130, 130, 1),
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Montserrat',
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                width: 20,
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                    child: Column(children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(top: 9),
                        child: Text(
                         ' ${currentProject.progressData['Digital Schools']}',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 34,
                            color: Color.fromRGBO(51, 51, 51, 1),
                            //height: 85,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: Text(
                          'Digital school',
                          style: TextStyle(
                              color: Color.fromRGBO(130, 130, 130, 1),
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Montserrat'),
                        ),
                      ),
                    ]),
                    color: Color.fromRGBO(234, 236, 253, 1),
                    height: 82,
                    width: 100,
                  ),
                  Container(
                    child: Column(children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(top: 9),
                        child: Text(
                          '${currentProject.progressData['Students']}',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 34,
                            color: Color.fromRGBO(51, 51, 51, 1),
                            //height: 85,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: Text(
                          'Students',
                          style: TextStyle(
                              color: Color.fromRGBO(130, 130, 130, 1),
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Montserrat'),
                        ),
                      ),
                    ]),
                    color: Color.fromRGBO(234, 236, 253, 1),
                    height: 82,
                    width: 100,
                  ),

                  Container(
                    color: Color.fromRGBO(234, 236, 253, 1),
                    height: 82,
                    width: 100,
                    child: Column(children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(top: 9),
                        child: Text(
                        // '${NumberFormat.compactLong().format(currentProject.currentDonation)}',
                       '${formatNumber(currentProject.currentDonation)}',

                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 34,
                            color: Color.fromRGBO(51, 51, 51, 1),
                            //height: 85,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: Text(
                          'Donation',
                          style: TextStyle(
                              color: Color.fromRGBO(130, 130, 130, 1),
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Montserrat'),
                        ),
                      ),
                    ]),
                  ),
                  //margin: EdgeInsets.all(12),
                  //padding: EdgeInsets.all(8),
                  //decoration: BoxDecoration(color: Colors.blueAccent,
                ],
              ),
              SizedBox(
                height: 70,
              ),
              const Divider(),
              // Padding(
              //   padding: EdgeInsets.only(left: 15),
              //   child: Row(
              //     children: <Widget>[
              //       Text(
              //         'Donation Status',
              //         style: TextStyle(
              //           color: Color.fromRGBO(0, 0, 0, 1),
              //           fontSize: 12,
              //           fontWeight: FontWeight.bold,
              //           fontFamily: 'Montserrat',
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
              // Padding(
              //   padding: EdgeInsets.symmetric(horizontal: 15),
              //   child: Row(
              //     children: <Widget>[
              //       Flexible(
              //         child: Container(
              //           width: 60,
              //           height: 5,
              //           padding: EdgeInsets.only(left: 12),
              //
              //           //symmetric(
              //           //  horizontal: 1,
              //           //  vertical: 2,
              //           //),
              //           decoration: BoxDecoration(
              //             color: Colors.black,
              //           ),
              //         ),
              //       ),
              //       Container(
              //         width: 180,
              //         height: 5,
              //         padding: EdgeInsets.symmetric(
              //           horizontal: 10,
              //           vertical: 2,
              //         ),
              //         decoration: BoxDecoration(
              //           color: Color.fromRGBO(232, 233, 245, 1),
              //         ),
              //         //child: Row(children: [
              //         //  SizedBox(width: 2),
              //         //]),
              //       ),
              //       const Spacer(),
              //       // SizedBox(
              //       //   width: 15,
              //       // ),
              //       new Positioned(
              //         left: MediaQuery.of(context).size.width / 2 + 100,
              //         top: MediaQuery.of(context).size.height / 2,
              //         child: new Container(
              //           width: 101.0,
              //           height: 26,
              //           //decoration: new BoxDecoration(color: Colors.red),
              //           child: SizedBox(
              //             width: 101,
              //             height: 26,
              //             child: ElevatedButton(
              //               child: Text(
              //                 'DONATE NOW',
              //                 style: TextStyle(
              //                   fontFamily: 'Montserrat',
              //                   fontWeight: FontWeight.w600,
              //                   fontSize: 9,
              //                   color: Color.fromRGBO(0, 0, 0, 1),
              //                 ),
              //               ),
              //               onPressed: () {},
              //               style: ElevatedButton.styleFrom(
              //                 backgroundColor: Color.fromRGBO(241, 200, 76, 1),
              //                 shape: RoundedRectangleBorder(
              //                   borderRadius: BorderRadius.circular(12.29),
              //                 ),
              //               ),
              //             ),
              //           ),
              //         ),
              //       ),
              //       // Padding(
              //       //   padding: EdgeInsets.only(left: 10, right: 20),
              //       //   child:
              //       // ),
              //     ],
              //   ),
              // ),
              // Padding(
              //     padding: EdgeInsets.only(left: 15),
              //     child: Row(
              //       children: <Widget>[
              //         Text(
              //           '34L',
              //           style: TextStyle(
              //             color: Color.fromRGBO(130, 130, 130, 1),
              //             fontSize: 12,
              //             fontWeight: FontWeight.w500,
              //             fontFamily: 'Montserrat',
              //           ),
              //         ),
              //         SizedBox(
              //           width: 200,
              //           height: 1,
              //         ),
              //         Text(
              //           '30%',
              //           textAlign: TextAlign.right,
              //           style: TextStyle(
              //             color: Color.fromRGBO(130, 130, 130, 1),
              //             fontSize: 12,
              //             fontWeight: FontWeight.w500,
              //             fontFamily: 'Montserrat',
              //           ),
              //         ),
              //       ],
              //     )),
            ],
          ),
        );
  }
}






// TextButton(
//                   onPressed: () {},
//                   child: Text(
//                     'DONATE',
//                   ))
      // bottomNavigationBar: BottomAppBar(
      //   color: Color.fromRGBO(255, 255, 255, 1),
      //   child: Row(
      //     children: <Widget>[
      //       Column(
      //         mainAxisSize: MainAxisSize.min,
      //         children: <Widget>[
      //           Text('hello'),
      //         ],
      //       ),
      //       Column(
      //         children: <Widget>[
      //           TextButton(onPressed: () {}, child: Text('donate')),
      //         ],
      //       )
      //     ],
      //   ),
      // ),
    
/*
@override
Widget build(BuildContext context) {
  return Card(
    margin: EdgeInsets.all(8),
    child: Row(children: []),
  );
}








bottomNavigationBar: BottomNavigationBar(
        
        items: const <BottomNavigationBarItem>[
          Title(color: Colors.black, child: Text('hi'),),
        ],
        selectedItemColor: Colors.amber[800],
        onTap: null,
      ),
Column(
          children: <Widget>[
            Row(
              children: [
                Text(
                  'Donation status',
                )
              ],
            ),
          ],
        ),

bottomNavigationBar: BottomAppBar(
          color: Color.fromRGBO(255, 255, 255, 1),
          child: Row(
            children: <Widget>[
              Column(
                children: <Widget>[
                  Text('hello'),
                ],
              ),
              Column(
                children: <Widget>[
                  TextButton(onPressed: () {}, child: Text('donate')),
                ],
              )
            ],
          )

          //floatingActionButton: FloatingActionButton(
          //onPressed: null,
          //child: Text(
          //  'DONATE',
          ),

Row(
            //mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 60),
                child: Text(
                  'Donation status',
                  //textAlign: TextAlign.left,
                ),
              ),
              Row(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(top: 75, left: 100),
                        child: TextButton(
                          onPressed: () {},
                          child: Text('DONATE'),
                        ),
                      ),
                    ],
                    // padding: const EdgeInsets.only(top: 10),
                    // child:
                  ),
                ],
              )
            ],
          ),

ConstrainedBox(
                constraints: BoxConstraints(maxHeight: 300),
              ),
              const DecoratedBox(decoration: BoxDecoration(color: Colors.black))
            ],

child: Text('01',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 20,
                  ))
children: Text(
      'Jo bhi',
      style: TextStyle(
        fontFamily: 'Montserrat',
        fontSize: 20,
        fontWeight: FontWeight.w600,
      ),
    )
*/
