import 'package:flutter/material.dart';
import '../widgets/app_bar_common.dart';

class HomePage extends StatefulWidget {
  static const String id = 'HomePage';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
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