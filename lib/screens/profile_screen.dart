import 'package:ahhf_app/authProvider/google_sign_in.dart';
import 'package:ahhf_app/screens/personal_details.dart';
import 'package:ahhf_app/provider/userAuth.dart';
import 'package:ahhf_app/screens/loginSignupScreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';

import './editProfileScreen.dart';
import '../templates/animation_template.dart';
import './aboutUsPage.dart';
import './contactUsPage.dart';

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
          child: Column(
            children: <Widget>[
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
                    padding: const EdgeInsets.only(top: 60),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
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
                                    backgroundImage: NetworkImage(
                                        userData['imageUrl'] as String),
                                  ),
                            const SizedBox(
                              height: 10,
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width,
                              child: Text(
                                // 'Anand B',
                                '${userData['name']}',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                ),
                                overflow: TextOverflow.fade,
                              ),
                            ),
                            const SizedBox(
                              height: 5,
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
                      ],
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              SizedBox(
                width: 110,
                height: 30,
                child: TextButton(
                  onPressed: () {
                    // Navigator.of(context).pushNamed(EditProfileScreen.id);
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => EditProfileScreen(
                          userData['id'],
                          userData['name'],
                          userData['email'],
                          userData['imageUrl'],
                        ),
                      ),
                    );
                  },
                  style: TextButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                          color: Colors.blue,
                          width: 1,
                          style: BorderStyle.solid),
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: Text('EDIT PROFILE',
                      style: TextStyle(
                          color: Colors.blue,
                          fontSize: 12,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w600)),
                ),
              ),
              ProfileMenuWidget(
                title: "Personal Details",
                icon: Icons.account_circle_outlined,
                onPress: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PersonalDetails(userData),
                      ));
                },
              ),
              // ProfileMenuWidget(
              //   title: "Donation",
              //   icon: Icons.account_balance_wallet_outlined,
              //   onPress: () {},
              // ),
              // ProfileMenuWidget(
              //   title: "Notification ",
              //   icon: Icons.notifications_active_outlined,
              //   onPress: () {},
              // ),
              // ProfileMenuWidget(
              //   title: "Settings ",
              //   icon: Icons.settings_outlined,
              //   onPress: () {},
              // ),
              ProfileMenuWidget(
                title: "Contact Us ",
                icon: Icons.call_outlined,
                onPress: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => ContactUsPage(),
                    ),
                  );
                },
              ),
              ProfileMenuWidget(
                title: "About Us ",
                icon: Icons.people_alt_outlined,
                onPress: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => AboutUsPage(),
                    ),
                  );
                },
              ),
              ProfileMenuWidget(
                title: "Logout ",
                icon: Icons.logout,
                onPress: () {
                  Provider.of<GoogleSignInProvider>(context, listen: false)
                      .logout();
                },
              ),
              // ProfileMenuWidget(
              //   title: "Animation ",
              //   icon: Icons.replay_outlined,
              //   onPress: () {
              //     showDialog(
              //         context: context,
              //         builder: (context) => LogoAnimationScreen());
              //   },
              // ),
            ],
          ),
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
          size: 30,
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

/*
ButtonStyle(
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                )),
              ),

*/