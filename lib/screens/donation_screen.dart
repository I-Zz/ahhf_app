import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'donation_history.dart';

class DonationScreen extends StatelessWidget {
  const DonationScreen({Key? key}) : super(key: key);

  static const String id = '/donation_screen';

  @override
  Widget build(BuildContext context) {
    //HexColor color = HexColor(#A6A6A6 as String);
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios_new,
            color: Colors.black,
            size: 15,
          ),
        ),
        centerTitle: true,
        title: Text(
          'Donation',
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              fontFamily: 'Montserrat',
              color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Center(
                child: Container(
                  width: 327,
                  height: 176,
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromRGBO(0, 0, 0, 0.06),
                          blurRadius: 7,
                          spreadRadius: 6,
                          offset: Offset(0, 0),
                        ),
                      ],
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: Color(0xFFC4C4C4), // a greyish tone color
                        width: 1.0,

                        //style: BoxShadow()
                      ),
                      color: Colors.white),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: TextField(
                          decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.currency_rupee,
                              color: Colors.black,
                            ),
                            hintText: '0',
                            hintStyle: TextStyle(
                                color: Colors.grey.shade400, fontSize: 24),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10, top: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextButton(
                              onPressed: () {},
                              style: ButtonStyle(
                                minimumSize: MaterialStateProperty.all<Size>(
                                    Size(70, 30)),
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Color(0xFFEAECFD)),
                              ),
                              child: Text(
                                "+500",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),

                            SizedBox(
                              width: 30,
                            ),
                            TextButton(
                              onPressed: () {},
                              style: ButtonStyle(
                                minimumSize: MaterialStateProperty.all<Size>(
                                    Size(70, 30)),
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Color(0xFFEAECFD)),
                              ),
                              child: Text(
                                "+500",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),

                            SizedBox(width: 30),
                            // Container(
                            //   width: 35,
                            //   height: 16,
                            //   child: Text("500"),
                            // ),
                            TextButton(
                              onPressed: () {},
                              style: ButtonStyle(
                                minimumSize: MaterialStateProperty.all<Size>(
                                    Size(70, 30)),
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Color(0xFFEAECFD)),
                              ),
                              child: Text(
                                "+500",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 15,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 6, horizontal: 1),
              child: Container(
                width: 327,
                height: 265,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromRGBO(0, 0, 0, 0.06),
                      blurRadius: 7,
                      spreadRadius: 6,
                      offset: Offset(0, 0),
                    ),
                  ],
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: Color(0xFFC4C4C4), // a greyish tone color
                    width: 1.0,

                    //style: BoxShadow()
                  ),
                  color: Colors.white,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10, top: 6),
                      child: Text(
                        "Pay Using Registered Bank Account",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                          fontFamily: 'Montserrat',
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset('assets/images/bank_img.png'),
                        SizedBox(
                          width: 4,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Bank of Maharashtra",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Montserrat'),
                            ),
                            Text(
                              'xxxxxxx5555',
                              style: TextStyle(
                                color: Color(0xFF4F4F4F),
                                fontSize: 10,
                              ),
                            )
                          ],
                        )

                        // SizedBox(
                        //   child: ListTile(
                        //     title: Text(
                        //       "Bank Of Maharashtra",
                        //       style: TextStyle(
                        //         color: Colors.black,
                        //         fontSize: 14,
                        //         fontWeight: FontWeight.bold,
                        //         fontFamily: 'Montserrat',
                        //       ),
                        //     ),
                        //   ),
                        // )
                      ],
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 8, bottom: 3, left: 13, right: 13),
                      child: OutlinedButton(
                        onPressed: () {},
                        child: Row(
                          children: [
                            Image.asset('assets/images/gpay_image.png'),
                            SizedBox(
                              width: 17,
                            ),
                            Text(
                              'Google Pay',
                              style: TextStyle(
                                color: Color(0xFF4F4F4F),
                                fontSize: 10,
                                fontWeight: FontWeight.w300,
                                fontFamily: 'Montserrat',
                              ),
                            ),
                            SizedBox(
                              width: 88,
                            ),
                            IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.arrow_forward_ios_rounded,
                                  color: Color(0xFF4F4F4F),
                                  size: 15,
                                ))
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 13, vertical: 3),
                      child: OutlinedButton(
                        onPressed: () {},
                        child: Row(
                          children: [
                            Image.asset('assets/images/upi_img.png'),
                            Image.asset('assets/images/p.png'),
                            Image.asset('assets/images/I.png'),
                            SizedBox(
                              width: 17,
                            ),
                            Text(
                              'UPI Pay',
                              style: TextStyle(
                                color: Color(0xFF4F4F4F),
                                fontSize: 10,
                                fontWeight: FontWeight.w300,
                                fontFamily: 'Montserrat',
                              ),
                            ),
                            SizedBox(
                              width: 105,
                            ),
                            IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.arrow_forward_ios_rounded,
                                  color: Color(0xFF4F4F4F),
                                  size: 15,
                                ))
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 13, vertical: 3),
                      child: OutlinedButton(
                        onPressed: () {},
                        child: Row(
                          children: [
                            Image.asset('assets/images/world.png'),
                            //Icon(Icons.)
                            SizedBox(
                              width: 17,
                            ),
                            Text(
                              'Net Banking',
                              style: TextStyle(
                                color: Color(0xFF4F4F4F),
                                fontSize: 10,
                                fontWeight: FontWeight.w300,
                                fontFamily: 'Montserrat',
                              ),
                            ),
                            SizedBox(
                              width: 116,
                            ),
                            IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.arrow_forward_ios_rounded,
                                  color: Color(0xFF4F4F4F),
                                  size: 15,
                                ))
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 13),
              child: Container(
                width: 327,
                height: 60,
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromRGBO(0, 0, 0, 0.06),
                        blurRadius: 7,
                        spreadRadius: 6,
                        offset: Offset(0, 0),
                      ),
                    ],
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Color(0xFFC4C4C4), // a greyish tone color
                      width: 1.0,

                      //style: BoxShadow()
                    ),
                    color: Colors.white),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, DonationHistoryScreen.id);
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8, top: 5),
                        child: Image.asset('assets/images/donation.png'),
                      ),
                    ),
                    SizedBox(
                      width: 11,
                    ),
                    Text(
                      'Donation History',
                      style: TextStyle(
                          color: Color(0xFF828282),
                          fontFamily: 'Montserrat',
                          fontSize: 14,
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      width: 100,
                    ),
                    Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: Colors.grey,
                      size: 15,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
