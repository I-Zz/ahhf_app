import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
//import 'package:my_login/register.dart';

class Mylogin extends StatefulWidget {
  const Mylogin({Key? key}) : super(key: key);

  @override
  State<Mylogin> createState() => _MyloginState();
}

class _MyloginState extends State<Mylogin> {
  String istapped = '';
  @override
  Widget build(BuildContext context) {
    ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned(
            //top: 20,
            bottom: 530,
            left: 91,
            child: Container(
              child: Image.asset("assets/images/full_logo.png"),
            ),
          ),
          Positioned(
            left: 48,
            bottom: 550,
            child: Container(
              padding: EdgeInsets.only(left: 135, top: 130),
              child: Text(
                'APPROACH\nHELPING HANDS\nFOUNDATION',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Positioned(
            left: 48,
            bottom: 530,
            child: Container(
              padding: EdgeInsets.only(left: 135, top: 205),
              child: Text(
                'Together We Can!',
                style: TextStyle(color: Colors.black, fontSize: 14),
              ),
            ),
          ),
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const SizedBox(height: 150),
                SizedBox(
                  height: 53,
                  width: 296,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Color.fromRGBO(59, 89, 152, 1),
                        side: BorderSide()),
                    onPressed: () {},
                    child: const Text(
                      'Connect with Facebook',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                SizedBox(
                  height: 53,
                  width: 296,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Color.fromRGBO(66, 133, 244, 1)),
                    onPressed: () {},
                    child: const Text(
                      'Connect with Google',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                SizedBox(
                  height: 53,
                  width: 296,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Color.fromRGBO(51, 51, 51, 1)),
                    onPressed: () {},
                    child: const Text(
                      'Login with email',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                SizedBox(
                  height: 53,
                  width: 296,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Color.fromRGBO(51, 51, 51, 1)),
                    onPressed: () {},
                    child: const Text(
                      'Login with phone',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                Positioned(
                  bottom: 10,
                  child: SizedBox(
                    height: 18,
                    width: 214,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Color.fromRGBO(255, 255, 255, 1)),
                      onPressed: () {},
                      child: const Text(
                        'I\'ll do this later',
                        style: TextStyle(fontSize: 18, color: Colors.black),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                Positioned(
                  child: Text(
                    'By signing up you agree to our terms of service',
                    style: TextStyle(fontSize: 10),
                    textAlign: TextAlign.end,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
