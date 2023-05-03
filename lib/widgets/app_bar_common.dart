import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import '../screens/donation_screen.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class AppBarCommon extends StatelessWidget implements PreferredSizeWidget {
  String? name;
  bool isHome;
  AppBarCommon(this.name, this.isHome);

  final String donationPageUrl = 'https://pages.razorpay.com/ahhf-donation';

  String displayUserName() {
    List<String> splittedName;
    String userName = '';

    if (name == null) {
      userName = 'Anand';
    } else {
      splittedName = name!.split(" ");
      if (splittedName[0].length < 3) {
        userName = splittedName[0] + splittedName[1];
      } else {
        userName = splittedName[0];
      }
    }
    return userName;
  }

  _launchURL() async {
    const url = 'https://pages.razorpay.com/ahhf-donation';
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Size get preferredSize => Size.fromHeight(82);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
          color: Color.fromRGBO(255, 255, 255, 1),
          boxShadow: [
            isHome
                ? const BoxShadow()
                : BoxShadow(
                    color: Color.fromRGBO(0, 0, 0, 0.06),
                    blurRadius: 7,
                    spreadRadius: 6,
                    offset: Offset(0, 0),
                  ),
          ],
        ),
        padding: const EdgeInsets.symmetric(horizontal: 18),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Spacer(),
                const Text(
                  'Hello,',
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'Montserrat',
                  ),
                ),
                Text(
                  // name.toString(),
                  displayUserName(),
                  style: const TextStyle(
                    fontSize: 20,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const Spacer(),
              ],
            ),
            // There might be issues with Donate now as i have manually added the height and width
            SizedBox(
              width: 150,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromRGBO(241, 200, 76, 1),
                  // elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, DonationScreen.id);
//                // onPressed: _launchURL,
//                onPressed: () {
//                  // launchUrlString(donationPageUrl);
//                  launch(donationPageUrl);
                },
                child: const Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 4,
                  ),
                  child: Text(
                    'DONATE NOW',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.black,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// class AppBarCommon extends AppBar {
//   // @override
//   // Widget build(BuildContext context) {
//   AppBarCommon()
//       : super(
        
//           actions: <Widget>[
//             Expanded(
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 // crossAxisAlignment: CrossAxisAlignment.start,
//                 children: <Widget>[
//                   Column(
//                     children: [
//                       Text('Hello,'),
//                       Text('Anand'),
//                     ],
//                   ),
//                   ElevatedButton(
//                     onPressed: null,
//                     child: Text('DONATE NOW'),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         );

  // return AppBar(
  //   actions: [
  //     Row(
  //       children: <Widget>[
  //         Column(
  //           children: <Widget>[
  //             Text('Hello,'),
  //             Text('Anand'),
  //           ],
  //         ),
  //         ElevatedButton(
  //           onPressed: null,
  //           child: Text('DONATE NOW'),
  //         ),
  //       ],
  //     ),
  //   ],
  // );

