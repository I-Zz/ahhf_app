import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../widgets/app_bar_common.dart';

import '../authProvider/google_sign_in.dart';

class HomePage extends StatefulWidget {
  static const String id = 'HomePage';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final user = FirebaseAuth.instance.currentUser;
  // final currentUser = GoogleSignInProvider().user;

  @override
  Widget build(BuildContext context) {
    print(user);
    // print(currentUser);

    // print(user!.photoURL);
    // print(user!.displayName);
    // print(user!.email);
    return Scaffold(
      appBar: AppBarCommon('Anand'),
      body: Center(
        child: Text('Home Screen'),
      ),
    );
  }
}




// Container(
//   padding: const EdgeInsets.all(8.0),
//   child: ListView.builder(
//
//       scrollDirection: Axis.horizontal,
//       itemCount: 10,
//       itemBuilder: (context, index) => Container(
//         height: 100,
//           width: 100,
//         child: Text(
//           'event$index',
//
//         ),
//
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(10),
//               // image: DecorationImage(
//               //     image: NetworkImage(imagelist[index]),
//               //     fit: BoxFit.cover),
//             ),
//           )),
// ),