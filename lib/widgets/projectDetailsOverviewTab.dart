import 'package:ahhf_app/provider/project.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

class projectDetailsOverviewTab extends StatelessWidget {
  final String projectID;
  final AllProjects allprojects;
  projectDetailsOverviewTab(
      {required this.projectID, required this.allprojects});

  final String donationPageUrl = 'https://pages.razorpay.com/ahhf-donation';

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

    final currentProject = allprojects.getProject(projectID);
    final totalDonation = currentProject.totalDonation;
    final currentDonation = currentProject.currentDonation;
    final progressDataKeys = currentProject.progressData.keys.toList();

    return Scaffold(
      backgroundColor: Color.fromRGBO(245, 245, 245, 1),

      //padding: const EdgeInsets.all(20),

      body: ListView(
        physics: BouncingScrollPhysics(),
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
            child: Column(
              children: <Widget>[
                // const SizedBox(height: 100),
                Text(
                  currentProject.longDescription1,
                  style: TextStyle(
                    color: Color.fromRGBO(130, 130, 130, 1),
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Montserrat',
                  ),
                ),
                Text(
                  currentProject.longDescription2,
                  style: TextStyle(
                    color: Color.fromRGBO(130, 130, 130, 1),
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Montserrat',
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                child: Column(children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(top: 9),
                    child: Text(
                      ' ${currentProject.progressData[progressDataKeys[1]]}',
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
                    padding: const EdgeInsets.only(top: 8, left: 4, right: 4),
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        // 'Digital school',
                        progressDataKeys[1],
                        style: TextStyle(
                            color: Color.fromRGBO(130, 130, 130, 1),
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Montserrat'),
                      ),
                    ),
                  ),
                ]),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(5),
                  ),
                  color: Color.fromRGBO(234, 236, 253, 1),
                ),
                height: 82,
                width: 100,
              ),
              Container(
                child: Column(children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(top: 9),
                    child: Text(
                      '${currentProject.progressData[progressDataKeys[0]]}',
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
                    padding: const EdgeInsets.only(top: 8, left: 4, right: 4),
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        // 'Students',
                        progressDataKeys[0],
                        style: TextStyle(
                            color: Color.fromRGBO(130, 130, 130, 1),
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Montserrat'),
                      ),
                    ),
                  ),
                ]),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(5),
                  ),
                  color: Color.fromRGBO(234, 236, 253, 1),
                ),
                height: 82,
                width: 100,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(5),
                  ),
                  color: Color.fromRGBO(234, 236, 253, 1),
                ),
                height: 82,
                width: 100,
                child: Column(
                  children: <Widget>[
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
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 130),
        ],
      ),
      bottomSheet: Container(
        height: 100,
        decoration: BoxDecoration(
          color: Colors.white,
          // boxShadow: [
          //   BoxShadow(
          //     color: Colors.black87,
          //     spreadRadius: 1,
          //     blurRadius: 20,
          //     offset: Offset(0, 20),
          //   ),
          // ],
        ),
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Donation Status',
              style: TextStyle(
                color: Color.fromRGBO(0, 0, 0, 1),
                fontSize: 12,
                fontWeight: FontWeight.bold,
                fontFamily: 'Montserrat',
              ),
            ),
            Row(
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    Container(
                      height: 7,
                      width: 200,
                      color: Color.fromRGBO(232, 233, 245, 1),
                    ),
                    Container(
                      height: 7,
                      // width: 50,
                      width: (currentDonation / totalDonation) * 100,
                      color: Colors.black,
                    ),
                  ],
                ),
                const SizedBox(width: 15),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      launch(donationPageUrl);
                    },
                    style: ElevatedButton.styleFrom(
                      padding:
                          EdgeInsets.symmetric(vertical: 0, horizontal: 15),
                      backgroundColor: Color.fromRGBO(241, 200, 76, 1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: const Text(
                      'DONATE NOW',
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w600,
                        fontSize: 9,
                        color: Color.fromRGBO(0, 0, 0, 1),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Text(
                  // '34L',
                  formatNumber(currentDonation),
                  style: TextStyle(
                    color: Color.fromRGBO(130, 130, 130, 1),
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Montserrat',
                  ),
                ),
                Spacer(flex: 1),
                Text(
                  // '30%',
                  '${(currentDonation / totalDonation) * 100}%',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    color: Color.fromRGBO(130, 130, 130, 1),
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Montserrat',
                  ),
                ),
                Spacer(flex: 1),
              ],
            ),
          ],
        ),
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
