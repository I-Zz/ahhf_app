import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/feed_admin.dart';
import '../provider/userAuth.dart';
import 'events_admin_portal.dart';
import 'feed_admin_portal.dart';

class AdminPortalScreen extends StatelessWidget {
  static const String id = '/admin_screen';
  const AdminPortalScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userData = Provider.of<CurrentUser>(context, listen: false)
        .getProfileScreenUserData;

    final feedData =
        Provider.of<AdminFeed>(context, listen: false).getCompleteFeedData;
    return Scaffold(
      appBar: AppBar(
        title: Text('Admin Portal'),
        centerTitle: true,
        backgroundColor: Color(0xFF008080),
        elevation: 0,
      ),
      body: Container(
        color: Color(0xFF004444),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 50),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 10,
                    offset: Offset(0, 5),
                  ),
                ],
              ),
              child: CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage(
                  'assets/images/logo.png',
                ),
              ),
            ),
            SizedBox(height: 50),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => EventAdminPortal(
                    userData['id'],
                    userData['dateTime'],
                    userData['imageUrl'],
                    userData['projectID'],
                    userData['title'],
                    userData['venue'],
                    userData['eventimageUrl'],
                  ),
                ));
              },
              child: Text(
                'Add Events',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                primary: Color(0xFF004444),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                elevation: 5,
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => FeedAdminScreen(
                    feedData['id'],
                    feedData['title'],
                    feedData['datetime'],
                    feedData['description'],
                    feedData['feedimageurl'],
                    feedData['projectID'],
                    feedData['likes'],
                    feedData['imageurl'],
                  ),
                ));
              },
              child: Text(
                'Add Feed',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                primary: Color(0xFF004444),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                elevation: 5,
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
