import 'package:ahhf_app/screens/loginSignupScreen.dart';
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
      width: 59,
      height: 53,
      textStyle: const TextStyle(
          fontSize: 20,
          color: Color.fromRGBO(30, 60, 87, 1),
          fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xFFBCBCC0),width: 1),
        borderRadius: BorderRadius.circular(5),
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

    String otpcode = '';

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

          SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 35.0, vertical: 10),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Enter OTP',
                style: TextStyle(
                  fontSize: 18,
                  fontFamily: 'SourceSansPro',
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32.0,vertical: 16),
            child: Pinput(
              length: 6,
              defaultPinTheme: defaultPinTheme,
              focusedPinTheme: focusedPinTheme,
              submittedPinTheme: submittedPinTheme,
              onChanged: (value) {
                otpcode = value;
              },
              showCursor: true,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32.0),
            child: SizedBox(
              width: double.infinity,
              height: 55,
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

                        setState(() {
                          isLoading = false;
                        });
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => TabsScreen()));
                      }
                    } on FirebaseAuthException catch (e) {
                      String errorMessage = 'Something went wrong.';

                      if (e.code == 'invalid-verification-code') {
                        errorMessage = 'Invalid verification code.';
                      } else if (e.code == 'session-expired') {
                        errorMessage =
                            'Verification session expired. Please try again.';
                      }
                      setState(() {
                        isLoading = false;
                      });
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text(errorMessage),
                          backgroundColor: Colors.red.withOpacity(0.9),
                          elevation: 2,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          behavior: SnackBarBehavior.floating,
                          duration: Duration(seconds: 2)));
                    }
                  },
                  child: isLoading == true
                      ? const CircularProgressIndicator(
                          color: Colors.white,
                        )
                      : const Text(
                    "Next",
                    style: TextStyle(
                        fontFamily: 'Source Sans Pro',
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                        color: Color(0xFFFFFFFF)),
                  )),

            ),
          ),
          const Spacer(flex: 2,)
        ],
      ),
    );
  }
}
