import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 60),
          child: Column(children: <Widget>[
            CircleAvatar(
              radius: 82,
              backgroundImage: AssetImage('assets/images/Profile.png'),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              'Anand B',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Montserrat',
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              'anand@gmail.com',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Montserrat',
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: Color.fromRGBO(130, 130, 130, 1),
              ),
            ),
            const Divider(),
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
            )
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
