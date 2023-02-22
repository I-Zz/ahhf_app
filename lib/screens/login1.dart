import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import './tabs_screen.dart';
//import 'package:my_login/register.dart';

class Mylogin extends StatefulWidget {
  static const String id = '/login_screen';

  @override
  State<Mylogin> createState() => _MyloginState();
}

class _MyloginState extends State<Mylogin> {
  String istapped = '';
  @override
  Widget build(BuildContext context) {
    ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));
    return Scaffold(
      // backgroundColor: Colors.white,
      backgroundColor: Color.fromRGBO(245, 246, 255, 1),
      // RGB(245, 246, 255)
      // backgroundColor: Color(0xffA6A6A6),

      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 32),
          width: double.infinity,
          height: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.symmetric(vertical: 60),
                child: Image.asset("assets/images/full_logo_black.png"),
              ),
              // const SizedBox(),
              const Spacer(),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Color.fromRGBO(59, 89, 152, 1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {},
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 12),
                        child: Icon(
                          Icons.facebook_outlined,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        'Connect with Facebook',
                        style: TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 15),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Color.fromRGBO(66, 133, 244, 1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {},
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12),
                  child: Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 8, bottom: 8, left: 10, right: 15),
                        child: Icon(
                          Icons.search,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        'Connect with Google',
                        style: TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 15),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Color.fromRGBO(51, 51, 51, 1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {},
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12),
                  child: Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 8, bottom: 8, left: 10, right: 15),
                        child: Icon(
                          Icons.email_sharp,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        'Login with email',
                        style: TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 15),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Color.fromRGBO(51, 51, 51, 1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {},
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12),
                  child: Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 8, bottom: 8, left: 10, right: 15),
                        child: Icon(
                          Icons.phone_android,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        'Login with phone',
                        style: TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                ),
              ),
              // const SizedBox(height: 30),
              const Spacer(),
              Container(
                child: TextButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, TabsScreen.id);
                  },
                  child: Text(
                    'I\'ll do this later',
                    style: TextStyle(
                      fontSize: 15,
                      color: Color.fromRGBO(67, 67, 67, 1),
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              // const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.only(
                  top: 0,
                  bottom: 16,
                  left: 16,
                  right: 16,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'By signing up you agree to our',
                      style: TextStyle(
                        fontSize: 12,
                        color: Color.fromRGBO(130, 130, 130, 1),
                        fontFamily: 'SourceSansPro',
                      ),
                      textAlign: TextAlign.end,
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        'terms of service',
                        style: TextStyle(
                          fontSize: 12,
                          color: Color.fromRGBO(47, 128, 237, 1),
                          fontFamily: 'SourceSansPro',
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
    );
  }
}
