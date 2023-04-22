import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactUsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios_new,
            color: Colors.black,
            size: 15,
          ),
        ),
        centerTitle: true,
        title: Text(
          'Contact Details',
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              fontFamily: 'Montserrat',
              color: Colors.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.call),
                const SizedBox(width: 15),
                Text(
                  'Contact Number: ',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 15,
                    // fontWeight: FontWeight.bold,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    const number = '+919423917738';
                    launch('tel://$number');
                  },
                  child: Text(
                    '+91 94239 17738',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            const Divider(),
            Row(
              children: [
                Icon(Icons.email),
                const SizedBox(width: 15),
                Text(
                  'Email: ',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 15,
                    // fontWeight: FontWeight.bold,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    const email = 'hi@approach.org.in';
                    launch('mailto:$email');
                  },
                  child: Text(
                    'hi@approach.org.in',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
