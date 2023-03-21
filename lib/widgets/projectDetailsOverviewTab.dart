import 'dart:math';

import 'package:flutter/material.dart';

class projectDetailsOverviewTab extends StatelessWidget {
  const projectDetailsOverviewTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //padding: const EdgeInsets.all(20),

      body: Column(
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            //mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 20, right: 50),
                child: Text(
                  'Lorem Ipsum is simply dummy text of the\nprinting and typesetting industry. Lorem Ipsum\nhas been the industry\'s standard dummy text\never since the 1500s',
                  //textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Color.fromRGBO(130, 130, 130, 1),
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Montserrat',
                  ),
                ),
              ),
              //Container(

              //),
              SizedBox(
                width: 20,
                height: 20,
              ),
              Container(
                child: Text(
                  'When an unknown printer took a galley of type\nand scrambled it to make a type specimen book.\nIt has survived not only five centuries',
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
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                child: Column(children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(top: 9),
                    child: Text(
                      '01',
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
                      '6500',
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
                child: Column(children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(top: 9),
                    child: Text(
                      '34L',
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
                color: Color.fromRGBO(234, 236, 253, 1),
                height: 82,
                width: 100,
              ),
              //margin: EdgeInsets.all(12),
              //padding: EdgeInsets.all(8),
              //decoration: BoxDecoration(color: Colors.blueAccent,
            ],
          ),
        ],
      ),

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
    );
  }
}
/*

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
