

import 'package:ahhf_app/authProvider/login_with_phone.dart';
import 'package:ahhf_app/screens/home.dart';
import 'package:ahhf_app/screens/login1.dart';
import 'package:ahhf_app/screens/tabs_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class OTPVerificationscreen extends StatefulWidget {
  final String VerificationId;

  OTPVerificationscreen({required this.VerificationId});

  @override
  State<OTPVerificationscreen> createState() => _OTPVerificationscreenState();
}

class _OTPVerificationscreenState extends State<OTPVerificationscreen> {


  final auth = FirebaseAuth.instance;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: TextStyle(
          fontSize: 20,
          color: Color.fromRGBO(30, 60, 87, 1),
          fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
        border: Border.all(color: Color.fromRGBO(234, 239, 243, 1)),
        borderRadius: BorderRadius.circular(20),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: Color.fromRGBO(114, 178, 238, 1)),
      borderRadius: BorderRadius.circular(8),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration?.copyWith(
        color: Color.fromRGBO(234, 239, 243, 1),
      ),
    );

    String otpcode='';



    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios_rounded,
            color: Colors.black,
          ),
        ),
        elevation: 0,
      ),
      body: Container(
        margin: EdgeInsets.only(left: 25, right: 25),
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/logo.png',
                width: 150,
                height: 150,
              ),
              SizedBox(
                height: 25,
              ),
              Text(
                "Phone Verification",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "We need to register your phone without getting started!",
                style: TextStyle(
                  fontSize: 16,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 30,
              ),
              Pinput(
                length: 6,
                defaultPinTheme: defaultPinTheme,
                focusedPinTheme: focusedPinTheme,
                submittedPinTheme: submittedPinTheme,
                onChanged: (value) {

                    otpcode = value;


                },
                showCursor: true,

              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                width: double.infinity,
                height: 45,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green.shade600,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                    onPressed: () async {
                      setState(() {
                        isLoading = true;
                      });
                      try {
                        if (otpcode == null) {
                          throw Exception('OTP code cannot be null');
                        }

                        PhoneAuthCredential credential =
                            PhoneAuthProvider.credential(
                                verificationId: widget.VerificationId,
                                smsCode: otpcode);
                        UserCredential userCredential =
                            await auth.signInWithCredential(credential);
                        if (userCredential != null) {
                          Navigator.popUntil(context, (route) {
                            if (route.settings.name == Mylogin.id) {
                              return true;
                            }
                            return false;
                          });
                          setState(() {
                            isLoading = false;
                          });
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => TabsScreen()));
                        }
                      }on FirebaseAuthException catch (e) {


                        String errorMessage = 'Something went wrong.';

                        if (e.code == 'invalid-verification-code') {
                          errorMessage = 'Invalid verification code.';
                        } else if (e.code == 'session-expired') {
                          errorMessage = 'Verification session expired. Please try again.';
                        }
                        setState(() {
                          isLoading = false;
                        });
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                                content: Text(errorMessage),
                                backgroundColor: Colors.red.withOpacity(0.9),
                                elevation: 2,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)
                                ),
                                behavior: SnackBarBehavior.floating,
                                duration: Duration(seconds: 2)
                            )
                        );
                      }
                    },
                    child: isLoading == true ? const CircularProgressIndicator(
                            color: Colors.white,
                          ) : const Text("Verify Phone Number")),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
