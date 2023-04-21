import 'package:ahhf_app/authProvider/phone_login_otp_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class PhoneAuthentication extends StatefulWidget {
  static const String id = 'PhoneAuthentication';

  const PhoneAuthentication({Key? key}) : super(key: key);

  @override
  State<PhoneAuthentication> createState() => _PhoneAuthenticationState();
}

class _PhoneAuthenticationState extends State<PhoneAuthentication> {
  TextEditingController countryController = TextEditingController();
  var phone = '';
  final phonecontroller = TextEditingController();
  final _auth = FirebaseAuth.instance;
  bool isLoading = false;
  @override
  void initState() {
    // TODO: implement initState
    countryController.text = "+91";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 120,
          ),
          Container(
            height: 67,
            width: 179,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/full_logo_black.png'),
                  fit: BoxFit.cover),
            ),
          ),
          const Spacer(flex: 1,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 35.0, vertical: 16),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Enter mobile number and login',
                style: TextStyle(
                  fontSize: 18,
                  fontFamily: 'SourceSansPro',
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 32),
            width: double.infinity,
            height: 60,
            decoration: BoxDecoration(
                border: Border.all(width: 1, color: Colors.grey),
                borderRadius: BorderRadius.circular(10)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 10,
                ),
                SizedBox(
                  width: 40,
                  child: TextField(
                    controller: countryController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                    ),
                  ),
                ),
                Text(
                  "|",
                  style: TextStyle(fontSize: 33, color: Colors.grey),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                    child: TextField(
                  onChanged: (value) {
                    setState(() {
                      phone = value;
                    });
                  },
                  controller: phonecontroller,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Phone",
                  ),
                ))
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 32.0,
            ),
            child: SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green.shade600,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                  onPressed: () async {
                    if (phone.isNotEmpty) {
                      setState(() {
                        isLoading = true;
                      });
                      await FirebaseAuth.instance.verifyPhoneNumber(
                          phoneNumber:
                              '${countryController.text + phone.trim()}',
                          verificationCompleted: (credintials) {
                            setState(() {
                              isLoading = false;
                            });
                            phonecontroller.clear();
                          },
                          verificationFailed: (error) {
                            phonecontroller.clear();
                            String errorMg = '';
                            if (error.code == 'invalid-phone-number') {
                              errorMg = 'Phone Number is not Valid';
                            } else {
                              errorMg = 'Something went wrong.Try again!';
                            }
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(errorMg.toString()),
                                backgroundColor: Colors.red.withOpacity(0.9),
                                elevation: 2,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                behavior: SnackBarBehavior.floating,
                                duration: Duration(seconds: 2),
                              ),
                            );

                            setState(() {
                              isLoading = false;
                            });
                          },
                          codeSent: (String verificationId, token) {
                            setState(() {
                              isLoading = false;
                            });
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => OTPVerificationscreen(
                                  VerificationId: verificationId,
                                ),
                              ),
                            );
                          },
                          codeAutoRetrievalTimeout: (error) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                    "Could not retrieve code. Please check your internet connection and try again."),
                                backgroundColor: Colors.red.withOpacity(0.9),
                                elevation: 2,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                behavior: SnackBarBehavior.floating,
                                duration: Duration(seconds: 2),
                              ),
                            );
                            setState(() {
                              isLoading = false;
                            });
                          });
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Enter the Phone Number'),
                          backgroundColor: Colors.red.withOpacity(0.9),
                          elevation: 2,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          behavior: SnackBarBehavior.floating,
                          duration: Duration(seconds: 2),
                        ),
                      );
                    }

                    //
                  },
                  child: isLoading
                      ? CircularProgressIndicator(
                          color: Colors.white,
                        )
                      : Text(
                          "Send the OTP",
                          style: TextStyle(
                              fontFamily: 'Source Sans Pro',
                              fontWeight: FontWeight.w600,
                              fontSize: 18,
                              color: Color(0xFFFFFFFF)),
                        )),
            ),
          ),
          const Spacer(flex:2,),
        ],
      ),
    );
  }
}
