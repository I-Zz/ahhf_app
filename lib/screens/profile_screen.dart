import 'package:ahhf_app/provider/userAuth.dart';
import 'package:ahhf_app/screens/loginSignupScreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ProfileScreen extends StatelessWidget {
  // final user = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    final userData = Provider.of<CurrentUser>(context, listen: false)
        .getProfileScreenUserData;
    return Scaffold(
      backgroundColor: Color.fromRGBO(245, 245, 245, 1),
      body: SingleChildScrollView(
        child: Container(
          //padding: const EdgeInsets.symmetric(vertical: 60),
          child: Column(children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(bottom: 20.0),
                  alignment: Alignment.topCenter,
                  height: 150.0,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          color: Color.fromRGBO(0, 0, 0, 0.06),
                          blurRadius: 5,
                          offset: const Offset(0, 10))
                    ],
                    color: Color.fromRGBO(255, 255, 255, 1),
                  ),
                  //child: Image.asset("assets/bgImage.jpg"),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 60, left: 120),
                  //padding: EdgeInsets.only(left: 120),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      (userData['imageUrl'] == null)
                          ? CircleAvatar(
                              radius: 82,
                              // backgroundImage:
                              //     AssetImage('assets/images/Profile.png'),
                              backgroundImage:
                                  AssetImage('assets/images/Profile.png'),
                            )
                          : CircleAvatar(
                              radius: 82,
                              backgroundColor: Colors.grey,
                              // backgroundImage:
                              //     AssetImage('assets/images/Profile.png'),
                              backgroundImage:
                                  NetworkImage(userData['imageUrl'] as String),
                            ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        // 'Anand B',
                        '${userData['name']}',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        // 'anand@gmail.com',
                        '${userData['email']}',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: Color.fromRGBO(130, 130, 130, 1),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
            //const Divider(),
            ProfileMenuWidget(
              title: "My Profile",
              icon: Icons.account_circle_outlined,
              onPress: () {},
            ),
            ProfileMenuWidget(
              title: "Blood group",
              icon: Icons.water_drop_outlined,
              onPress: () {},
            ),
            ProfileMenuWidget(
              title: "Donation",
              icon: Icons.account_balance_wallet_outlined,
              onPress: () {},
            ),
            ProfileMenuWidget(
              title: "Address",
              icon: Icons.pin_drop_outlined,
              onPress: () {},
            ),
            ProfileMenuWidget(
              title: "Notification ",
              icon: Icons.notifications_active_outlined,
              onPress: () {},
            ),
            ProfileMenuWidget(
              title: "Settings ",
              icon: Icons.settings_outlined,
              onPress: () {},
            ),
            // ProfileMenuWidget(
            //   title: "logout ",
            //   icon: Icons.settings_outlined,
            //   onPress: () {
            //     FirebaseAuth.instance.signOut();
            //
            //
            //
            //   },
            // )
          ]),
        ),
      ),
    );
  }
}

class ProfileMenuWidget extends StatelessWidget {
  const ProfileMenuWidget({
    super.key,
    required this.title,
    required this.icon,
    required this.onPress,
    this.endIcon = true,
    this.textColor,
  });

  final String title;
  final IconData icon;
  final VoidCallback onPress;
  final bool endIcon;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onPress,
      leading: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.horizontal(),
        ),
        child: Icon(
          icon,
          color: Color.fromRGBO(130, 130, 130, 1),
        ),
      ),
      title: Text(
        title,
        style: TextStyle(
            fontFamily: 'Montserrat',
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Color.fromRGBO(130, 130, 130, 1)),
      ),
      trailing: endIcon
          ? Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.horizontal(),
              ),
              child: const Icon(
                Icons.arrow_forward_ios_outlined,
                color: Colors.black,
              ),
            )
          : null,
    );
  }
}
