import 'package:flutter/material.dart';
import './login1.dart';
import './register.dart';
import './screens/home.dart';

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
