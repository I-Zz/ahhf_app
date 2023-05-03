import 'package:ahhf_app/provider/userAuth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PersonalDetails extends StatelessWidget {
  // String? userId;
  Map<String, String?> userData;
  PersonalDetails(this.userData);

  @override
  Widget build(BuildContext context) {
    // final userData = Provider.of<CurrentUser>(context, listen: false).getCompleteUserData;
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
          'Personal Details',
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              fontFamily: 'Montserrat',
              color: Colors.black),
        ),
      ),
      backgroundColor: Color.fromRGBO(245, 245, 245, 1),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          // DetailsText(title: "Name", subtitle: "Anand "),
          // // DetailsText(title: "First Name", subtitle: "Anand "),
          // // DetailsText(title: "Last Name", subtitle: "B"),
          // DetailsText(title: "Email", subtitle: "anand@gmail.com"),
          // DetailsText(title: "Date of Birth", subtitle: "Jan-10-1994"),
          // DetailsText(title: "Blood group", subtitle: "O+"),
          // DetailsText(title: "Address", subtitle: "Pune, Maharashtra, India"),

          DetailsText(title: "Name", subtitle: userData['name'].toString()),
          DetailsText(title: "Email", subtitle: userData['email'].toString()),
          DetailsText(
              title: "Date of Birth", subtitle: userData['dob'].toString()),
          DetailsText(
              title: "Blood group",
              subtitle: userData['bloodGroup'].toString()),
          DetailsText(
              title: "Address", subtitle: userData['address'].toString()),
        ],
      ),
    );
  }
}

class DetailsText extends StatelessWidget {
  const DetailsText({super.key, required this.title, required this.subtitle});

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      dense: true,
      contentPadding: EdgeInsets.only(left: 20.0, top: 0.0, bottom: 0.0),
      title: Text(
        title,
        style: TextStyle(
            fontFamily: 'Montserrat',
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: Color.fromRGBO(130, 130, 130, 1)),
      ),
      subtitle: Text(
        subtitle,
        style: TextStyle(
            fontFamily: 'Montserrat',
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Color.fromRGBO(0, 0, 0, 1)),
      ),
    );
  }
}
