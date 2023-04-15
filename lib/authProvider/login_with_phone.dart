
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
  var phone='';
  final phonecontroller=TextEditingController();
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
              Container(
                height: 55,
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

                      onChanged: (value){
                        setState(() {
                          phone=value;
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
              SizedBox(
                width: double.infinity,
                height: 45,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green.shade600,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                    onPressed: () async{
                      if(phone.isNotEmpty){
                        setState(() {
                          isLoading = true;
                        });
                      await  FirebaseAuth.instance.verifyPhoneNumber(
                            phoneNumber: '${countryController.text + phone.trim()}',
                            verificationCompleted: (credintials) {

                              setState(() {
                                isLoading = false;
                              });
                              //phonecontroller.clear();
                            },
                            verificationFailed: (error) {
                              phonecontroller.clear();
                              String errorMg='';
                             if(error.code=='invalid-phone-number'){
                               errorMg='Phone Number is not Valid';
                             }
                             else{
                               errorMg='Something went wrong.Try again!';
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
                                isLoading=false;
                              });
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => OTPVerificationscreen(
                                      VerificationId: verificationId,),
                                ),
                              );                            },
                            codeAutoRetrievalTimeout: (error) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(error.toString()),
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
                      }else{

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
                        ? CircularProgressIndicator(color: Colors.white,)
                        : Text("Send the OTP")),
              )
            ],
          ),
        ),
      ),
    );
  }
}
//
// import 'package:ahhf_app/authProvider/phone_login_otp_screen.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
//
//
// class PhoneAuthentication extends StatefulWidget
// {
//   static const String id = 'PhoneAuthentication';
//   const PhoneAuthentication({Key? key}):super(key: key);
//   @override
//   State<PhoneAuthentication>createState()=>_SignWithPhone();
// }
//
// class _SignWithPhone extends State<PhoneAuthentication>
// {
//   TextEditingController countryCode=TextEditingController();
//   TextEditingController phoneController=TextEditingController();
//   @override
//   void initState(){
//     countryCode.text="+91";
//     super.initState();
//   }
//   void sendOtp() async {
//     String phone = countryCode.text + phoneController.text.trim();
//     await FirebaseAuth.instance.verifyPhoneNumber(
//         phoneNumber: phone,
//         codeSent: (verificationId, resendToken) {
//           Navigator.push(context,MaterialPageRoute(builder: (context)=> OTPVerificationscreen(verificationId: verificationId,),
//           ));
//         },
//         verificationCompleted: (credential) {},
//         verificationFailed: (ex) {
//           // log(ex.code.toString());
//           const snackBar = SnackBar(
//             content: Text('Verification failed!'),
//             backgroundColor: Colors.pink,
//             duration: Duration(seconds: 5),
//           );
//           ScaffoldMessenger.of(context).showSnackBar(snackBar);
//         },
//         codeAutoRetrievalTimeout: (verificationId) {},
//         //duration
//         timeout:Duration(seconds: 60)
//     );
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         margin: const EdgeInsets.only(left: 24, right: 24),
//         alignment: Alignment.center,
//         width: double.infinity,
//         height: double.infinity,
//         child: SingleChildScrollView(
//           child: Column(
//             children: [
//               Image.network(
//                 'https://img.freepik.com/free-vector/sign-concept-illustration_114360-125.jpg?w=1800&t=st=1681147870~exp=1681148470~hmac=a4e190b3484c70642b180d8586bc31478aa3f7aded4319775bcb85a83ffbbb4c',
//                 height: 200, width: 200,),
//               const SizedBox(height: 5,),
//               const Text('Phone Verification',
//                 style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),),
//               const SizedBox(height: 6,),
//               const Text('We need to register your phone before get started!',
//                 style: TextStyle(fontSize: 15),
//                 textAlign: TextAlign.center,),
//               const SizedBox(height: 20),
//               Container(
//                 decoration: BoxDecoration(
//                     border: Border.all(width: 1, color: Colors.grey),
//                     borderRadius: BorderRadius.circular(10)
//                 ),
//                 child: Row(
//                   children: [
//                     const SizedBox(width: 10,),
//                     SizedBox(
//                       width: 40,
//                       child: TextField(
//                         controller: countryCode,
//                         decoration: const InputDecoration(
//                             border: InputBorder.none
//                         ),
//                       ),
//                     ),
//                     const Text(
//                       '|', style: TextStyle(fontSize: 34, color: Colors.grey),),
//                     Expanded(
//                       child: TextField(
//                         keyboardType: TextInputType.phone,
//                         controller: phoneController,
//                         decoration: const InputDecoration(
//                             hintText: 'Enter Phone Number',
//                             border: InputBorder.none
//                         ),
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//               const SizedBox(height: 20,),
//               SizedBox(
//                 width: double.infinity,
//                 height: 50,
//                 child: ElevatedButton(
//                   onPressed: () {
//                     sendOtp();
//                   },
//                   style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(10)
//                   )),
//                   child: const Text(
//                     'Send the code', style: TextStyle(fontSize: 18),
//                   ),
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
// }