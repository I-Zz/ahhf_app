import 'package:ahhf_app/provider/member.dart';
import 'package:ahhf_app/provider/project.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class projectDetailsMembersTab extends StatelessWidget {
  final String projectID;
  final AllProjects allProjects;
  projectDetailsMembersTab(
      {required this.allProjects, required this.projectID});

  @override
  Widget build(BuildContext context) {
    final List<dynamic> membersIDs = allProjects.getProject(projectID).members;

    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('members')
            .where('id',
                whereIn: membersIDs) // Replace with your collection name
            .snapshots(),
        builder: (ctx, membersnapshot) {
          if (membersnapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (membersnapshot.hasError) {
            return Center(
              child: Text('Something went wrong'),
            );
          }

          final membersMapList = membersnapshot.data?.docs;
          print(membersMapList);
          final membersList = membersMapList
              ?.map((memberdata) => Member(
                  id: memberdata['id'].toString(),
                  name: memberdata['name'],
                  imageUrl: memberdata['memberImageUrl']))
              .toList();

          return ListView.builder(
            itemCount: membersList?.length,
            itemBuilder: (context, i) => ProfileMenuWidget(
              title: membersList![i].name,
              imageUrl: membersList[i].imageUrl,
              onPress: () {},
              subtitle: i == 0 ? 'Team Leader' : '',
            ),
          );
        },
      ),
    );
  }
}

class ProfileMenuWidget extends StatelessWidget {
  ProfileMenuWidget({
    required this.title,
    this.subtitle = '',
    required this.imageUrl,
    required this.onPress,
    this.endIcon = true,
    this.textColor,
  });

  final String title;
  final String subtitle;
  final String imageUrl;
  //final IconData icon;
  final VoidCallback onPress;
  final bool endIcon;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 25),
      onTap: onPress,
      leading: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.horizontal(),
        ),
        child: CircleAvatar(
          radius: 9,
          backgroundColor: Colors.grey.shade100,
          backgroundImage: NetworkImage(imageUrl),
        ),
      ),
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
              // width: 40,
              // height: 40,
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
