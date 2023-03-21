import 'package:flutter/material.dart';

class projectDetailsMembersTab extends StatelessWidget {
  const projectDetailsMembersTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Column(children: <Widget>[
            //const Divider(),
            ProfileMenuWidget(
              title: "Kartik Jagtap",
              subtitle: 'Team Leader',
              onPress: () {},
            ),
            ProfileMenuWidget(
              title: "Sourish Joshi",
              subtitle: 'Team Leader',
              // icon: Icons.water_drop_outlined,
              onPress: () {},
            ),
            ProfileMenuWidget(
              title: "Imroz Khan",
              subtitle: 'Team Leader',
              // icon: Icons.account_balance_wallet_outlined,
              onPress: () {},
            ),
            ProfileMenuWidget(
              title: "Nupur Sangwai",
              subtitle: 'Team Leader',
              // icon: Icons.pin_drop_outlined,
              onPress: () {},
            ),
            ProfileMenuWidget(
              title: "Tanmay Mahajan",
              subtitle: 'Team Leader',
              //  icon: Icons.notifications_active_outlined,
              onPress: () {},
            ),
            ProfileMenuWidget(
              title: "Kartik Jagtap",
              subtitle: 'Team Leader',
              // icon: Icons.settings_outlined,
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
    required this.subtitle,
    //required this.icon,
    required this.onPress,
    this.endIcon = true,
    this.textColor,
  });

  final String title;
  final String subtitle;
  //final IconData icon;
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
          child: CircleAvatar(
            radius: 9,
            backgroundImage:
                AssetImage('assets/images/circleavatarprojectmembertab1.png'),
          )),
      title: Text(
        title,
        style: TextStyle(
            fontFamily: 'Montserrat',
            fontSize: 17,
            fontWeight: FontWeight.w600,
            color: Colors.black),
      ),
      subtitle: Text(
        subtitle,
        style: TextStyle(
            fontFamily: 'Montserrat',
            fontSize: 13,
            fontWeight: FontWeight.w300,
            color: Colors.grey.shade500),
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
