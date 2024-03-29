import 'package:ahhf_app/provider/project.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../screens/projects_detail_screen_overview.dart';
import 'app_bar_common.dart';

class ProjectScreenCards extends StatelessWidget {
  final String image;
  final String titletext;
  final String subtitletext;
  final String projectID;

  ProjectScreenCards(
      {required this.titletext,
      required this.subtitletext,
      required this.image,
      required this.projectID});

  @override
  Widget build(BuildContext context) {
    var allprojects = Provider.of<AllProjects>(context, listen: false);

    return GestureDetector(
      onTap: (() {
        Navigator.of(context).push(
            // context,
            MaterialPageRoute(
                builder: (context) => ProjectsDetailScreen(
                      projectID: projectID,
                      allProjects: allprojects,
                    )));
      }),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        // ignore: sort_child_properties_last
        child: Row(
          children: [
            Container(
              width: 57,
              height: 135,

              // ignore: prefer_const_constructors
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(image),
                  // fit: BoxFit.cover,
                  fit: BoxFit.fitHeight,
                ),
                borderRadius:
                    // ignore: prefer_const_constructors
                    BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  topLeft: Radius.circular(10),
                ),
                color: Colors.transparent,
              ),

              //color: Colors.black,
            ),
            SizedBox(width: 10),
            Expanded(
              child: Column(
                //mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                // ignore: prefer_const_literals_to_create_immutables
                children: <Widget>[
                  // ignore: prefer_const_constructors
                  Padding(
                    padding: const EdgeInsets.only(top: 14),
                    // ignore: prefer_const_constructorso
                    child: Text(
                      titletext,
                      style: TextStyle(
                        color: Color.fromRGBO(51, 51, 51, 0.9),
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Montserrat',
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8, right: 11),
                    child: Text(
                      subtitletext,
                      style: TextStyle(
                          color: Color.fromRGBO(130, 130, 130, 1),
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Montserrat'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 10),
                    child: Stack(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            CircleAvatar(
                              radius: 13,
                              backgroundColor: Colors.yellow,
                            )
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            SizedBox(
                              width: 20,
                            ),
                            CircleAvatar(
                              radius: 13,
                              backgroundColor: Colors.yellow.shade600,
                            ),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            SizedBox(
                              width: 40,
                            ),
                            CircleAvatar(
                              radius: 13,
                              backgroundColor: Colors.yellow.shade800,
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),

            //Icon(Icons.arrow_forward_ios, color: Colors.blue),

            // do something for the listtile
          ],
        ),
        color: Colors.white,
      ),
    );
  }
}
