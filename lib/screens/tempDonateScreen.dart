import 'package:ahhf_app/provider/userAuth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class donation extends StatefulWidget {
  const donation({Key? key}) : super(key: key);

  @override
  State<donation> createState() => _donationState();
}

class _donationState extends State<donation> {
  TextEditingController _textEditingController = TextEditingController();
  int money = 0;

  CurrentUser user = CurrentUser();

  Razorpay? _razorpay = Razorpay();
  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    Fluttertoast.showToast(
        msg: "SUCCESS PAYMENT: ${response.paymentId}", timeInSecForIosWeb: 4);
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    Fluttertoast.showToast(
        msg: "ERROR HERE: ${response.code} - ${response.message}",
        timeInSecForIosWeb: 4);
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    Fluttertoast.showToast(
        msg: "EXTERNAL_WALLET IS : ${response.walletName}",
        timeInSecForIosWeb: 4);
  }

  void openPaymentPortal(Map<String, String?> userdata) async {
    // var userData = user.getProfileScreenUserData;
    var user = FirebaseAuth.instance.currentUser;
    var querySnapshot =
        await FirebaseFirestore.instance.collection('users').get();

    var fetchedUsersData = querySnapshot.docs;

    var options = {
      'key': 'rzp_test_P2z5wwM6GBOGnO',
      'amount': money * 100,
      'name': user!.displayName,
      'description': 'Test Payment',
      'prefill': {'contact': user.phoneNumber, 'email': user.email},
      'external': {
        'wallets': ['paytm']
      }
    };

    try {
      _razorpay?.open(options);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  void initState() {
    super.initState();
    _razorpay = Razorpay();
    _razorpay?.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay?.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay?.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  void addValue(int val) {
    var value = _textEditingController.text;
    money = int.parse(value);
    print(money);
  }

  @override
  Widget build(BuildContext context) {
    final userData = Provider.of<CurrentUser>(context, listen: false)
        .getProfileScreenUserData;
    return Scaffold(
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
      // backgroundColor: Color.fromRGBO(245, 245, 245, 1),
      backgroundColor: Colors.grey.shade50,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Center(
                child: Container(
                  // width: 327,
                  // height: 176,
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
                      // border: Border.all(
                      //   color: Color(0xFFC4C4C4), // a greyish tone color
                      //   width: 1.0,

                      //   //style: BoxShadow()
                      // ),
                      color: Colors.white),
                  child: Column(
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 20),
                        child: Text(
                          'Enter the Donation Amount',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'Montserrat',
                              color: Colors.black),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(26.0),
                        child: TextField(
                          controller: _textEditingController,
                          onChanged: (text) {
                            money = int.parse(text);
                            print(money);
                          },
                          decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.currency_rupee,
                              color: Colors.black,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                color: Colors.grey.shade100,
                                width: 1.0,
                              ),
                            ),
                            hintText: '0',
                            hintStyle: TextStyle(
                                color: Colors.grey.shade400, fontSize: 24),
                          ),
                          keyboardType: TextInputType.number,
                        ),
                      ),
                      // Padding(
                      //   padding: const EdgeInsets.only(bottom: 26),
                      //   child: Row(
                      //     mainAxisAlignment: MainAxisAlignment.center,
                      //     children: [
                      //       TextButton(
                      //         onPressed: () {},
                      //         style: ButtonStyle(
                      //           minimumSize: MaterialStateProperty.all<Size>(
                      //               Size(70, 30)),
                      //           backgroundColor:
                      //               MaterialStateProperty.all<Color>(
                      //             Color(0xFFEAECFD),
                      //           ),
                      //         ),
                      //         child: Text(
                      //           "+500",
                      //           style: TextStyle(
                      //             color: Colors.black,
                      //             fontSize: 14,
                      //             fontWeight: FontWeight.w500,
                      //           ),
                      //         ),
                      //       ),

                      //       SizedBox(
                      //         width: 30,
                      //       ),
                      //       TextButton(
                      //         onPressed: () {},
                      //         style: ButtonStyle(
                      //           minimumSize: MaterialStateProperty.all<Size>(
                      //               Size(70, 30)),
                      //           backgroundColor:
                      //               MaterialStateProperty.all<Color>(
                      //                   Color(0xFFEAECFD)),
                      //         ),
                      //         child: Text(
                      //           "+1000",
                      //           style: TextStyle(
                      //             color: Colors.black,
                      //             fontSize: 14,
                      //             fontWeight: FontWeight.w500,
                      //           ),
                      //         ),
                      //       ),

                      //       SizedBox(width: 30),
                      //       // Container(
                      //       //   width: 35,
                      //       //   height: 16,
                      //       //   child: Text("500"),
                      //       // ),
                      //       TextButton(
                      //         onPressed: () {},
                      //         style: ButtonStyle(
                      //           minimumSize: MaterialStateProperty.all<Size>(
                      //               Size(70, 30)),
                      //           backgroundColor:
                      //               MaterialStateProperty.all<Color>(
                      //                   Color(0xFFEAECFD)),
                      //         ),
                      //         child: Text(
                      //           "+2000",
                      //           style: TextStyle(
                      //             color: Colors.black,
                      //             fontSize: 14,
                      //             fontWeight: FontWeight.w500,
                      //           ),
                      //         ),
                      //       ),
                      //     ],
                      //   ),
                      // ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: ElevatedButton(
                          onPressed: () {
                            openPaymentPortal(userData);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            // elevation: 5,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 8, bottom: 8),
                                  child: Icon(
                                    Icons.payment_rounded,
                                    // color: Colors.blue,
                                  ),
                                ),
                                Text(
                                  'Proceed to Donate',
                                  style: TextStyle(
                                    // color: Colors.black,
                                    fontSize: 18,
                                  ),
                                ),
                                Icon(Icons.arrow_forward_ios_outlined),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 20.0, right: 20.0, bottom: 20.0),
                        child: ElevatedButton(
                          onPressed: () {
                            final String donationPageUrl =
                                'https://pages.razorpay.com/ahhf-donation';
                            launch(donationPageUrl);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color.fromRGBO(51, 51, 51, 1),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            // elevation: 5,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 8, bottom: 8),
                                  child: Icon(
                                    Icons.launch_outlined,
                                    // color: Colors.blue,
                                  ),
                                ),
                                Text(
                                  'Donate on Website',
                                  style: TextStyle(
                                    // color: Colors.black,
                                    fontSize: 18,
                                  ),
                                ),
                                Icon(Icons.arrow_forward_ios_outlined),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      // body: Center(
      //   child: ElevatedButton(
      //     onPressed: () {
      //       openPaymentPortal();
      //     },
      //     child: Text('buy now'),
      //   ),
      // ),
    );
  }
}
