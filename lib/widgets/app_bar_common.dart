import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class AppBarCommon extends StatelessWidget implements PreferredSizeWidget {
  String name;
  AppBarCommon(this.name);

  @override
  Size get preferredSize => Size.fromHeight(82);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: const BoxDecoration(
          color: Color.fromRGBO(255, 255, 255, 1),
          boxShadow: [
            BoxShadow(
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
                  name,
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
                onPressed: () {},
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

