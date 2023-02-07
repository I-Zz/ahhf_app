import 'package:flutter/material.dart';
import 'package:ahhf_app/login1.dart';
import 'package:ahhf_app/register.dart';
import 'home_files/home.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: Mylogin1.id,
    routes: {
      Mylogin1.id: (context) => Mylogin1(),
      Myregister.id: (context) => Myregister(),
      HomePage.id: (context) => HomePage(),
    },
  ));
}
