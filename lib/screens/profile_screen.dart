import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 20.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Container(
            height: 70,
            color: Colors.white,
            child: Row(
              children: <Widget>[
                Container(
                  color: Colors.red,
                  width: 70,
                  height: 70,
                  child: Icon(Icons.cake, color: Colors.white),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text('Test Title'),
                      Text('Test Video', style: TextStyle(color: Colors.grey))
                    ],
                  ),
                ),
                Icon(Icons.arrow_forward_ios, color: Colors.blue),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
