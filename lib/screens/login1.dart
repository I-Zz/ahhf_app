import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ahhf_app/screens/login1.dart';
import 'package:ahhf_app/screens/home.dart';
import 'package:ahhf_app/screens/register.dart';

class Mylogin1 extends StatefulWidget {
  static const String id = 'Mylogin1';

  const Mylogin1({Key? key}) : super(key: key);

  @override
  State<Mylogin1> createState() => _Mylogin1State();
}

class _Mylogin1State extends State<Mylogin1> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/images/logo.png'), fit: BoxFit.cover),
      ),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Stack(
            children: [
              Container(
                  padding: EdgeInsets.only(top: 10, left: 30),
                  child: Text(
                    "WELCOME TO\nAPPROACH HELPING HANDS!",
                    style: TextStyle(
                        fontSize: 30,
                        color: Colors.black,
                        fontWeight: FontWeight.w700),
                  )),
              SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.5,
                      left: 35,
                      right: 35),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextField(
                        decoration: InputDecoration(
                          prefixIcon: Padding(
                            padding: const EdgeInsets.all(15),
                            child: Icon(Icons.email_rounded),
                          ),
                          fillColor: Colors.grey.shade200,
                          filled: true,
                          hintText: 'Email ID',
                          hintStyle: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 18,
                      ),
                      TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                          prefixIcon: Padding(
                            padding: const EdgeInsets.all(15),
                            child: Icon(Icons.lock_rounded),
                          ),
                          suffixIcon: Padding(
                            padding: const EdgeInsets.all(15),
                            child: Icon(Icons.remove_red_eye),
                          ),
                          fillColor: Colors.grey.shade200,
                          filled: true,
                          hintText: 'Password',
                          hintStyle: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Sign in',
                            style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.w700,
                                color: Colors.black),
                          ),
                          CircleAvatar(
                            backgroundColor: Colors.black,
                            child: IconButton(
                              color: Colors.white,
                              onPressed: () {
                                Navigator.pushNamed(context, HomePage.id);
                              },
                              icon: Icon(
                                Icons.arrow_forward,
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white),
                              onPressed: () {
                                Navigator.pushNamed(context, Myregister.id);
                              },
                              child: Text(
                                'SIGN UP ',
                                style: TextStyle(
                                    fontSize: 18,
                                    decoration: TextDecoration.none,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w700),
                              )),
                          TextButton(
                              onPressed: () {},
                              child: Text(
                                'FORGOT PASSOWRD ?',
                                style: TextStyle(
                                    fontSize: 13,
                                    decoration: TextDecoration.underline,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w700),
                              ))
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
