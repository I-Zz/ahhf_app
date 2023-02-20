import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
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
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned(
            //top: 20,
            bottom: 530,
            left: 91,
            child: Container(
              child: Image.asset("assets/images/full_logo_black.png"),
            ),
          ),  
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const SizedBox(height: 300),
                SizedBox(
                  height: 40,
                  width: 270,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Color.fromRGBO(59, 89, 152, 1),
                        side: BorderSide()),
                    onPressed: () {},
                    child: Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 8, bottom: 8, left: 10, right: 15),
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
                const SizedBox(height: 12),
                SizedBox(
                  height: 40,
                  width: 270,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Color.fromRGBO(66, 133, 244, 1)),
                    onPressed: () {},
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
                const SizedBox(height: 12),
                SizedBox(
                  height: 40,
                  width: 270,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Color.fromRGBO(51, 51, 51, 1)),
                    onPressed: () {},
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
                const SizedBox(height: 12),
                SizedBox(
                  height: 40,
                  width: 270,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Color.fromRGBO(51, 51, 51, 1)),
                    onPressed: () {},
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
                const SizedBox(height: 30),
                Positioned(
                      child: TextButton(
                        onPressed: () {},
                        child: Text('I\'ll do this later'),
                        
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
