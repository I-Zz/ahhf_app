import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'images.dart';
import 'package:navigation_drawer_menu/navigation_drawer_menu.dart';
import 'package:control_style/control_style.dart';
import 'package:scaffold_gradient_background/scaffold_gradient_background.dart';
import 'navbar.dart';

const double kTexttitlesize = 25;
const double kBorderradius = 10;

class HomePage extends StatefulWidget {
  static const String id = 'HomePage';

  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> imagelist = ImageList().imageList;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Colors.green, Colors.yellow, Colors.white])),
      child: Scaffold(
        drawer: NavBarslider(),
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text(
            'HOME PAGE',
            style: TextStyle(
                fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: ListView(
            children: [
              Padding(
                padding: EdgeInsets.all(25.0),
                child: Text(
                  'NEWS FEED',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: kTexttitlesize,
                  ),
                ),
              ),
              SizedBox(
                height: 01,
              ),
              CarouselSlider(
                  items: imagelist
                      .map((item) => Container(
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(kBorderradius),
                              image: DecorationImage(
                                image: NetworkImage(item),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ))
                      .toList(),
                  options: CarouselOptions(
                    height: 150,
                    enlargeCenterPage: true,
                    reverse: true,
                    enableInfiniteScroll: false,
                    aspectRatio: 1.0,
                    viewportFraction: 0.85,
                  )),
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: Text(
                  'UPCOMING AND CURRENT EVENTS',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: kTexttitlesize,
                  ),
                ),
              ),
              CarouselSlider(
                  items: imagelist
                      .map((item) => Container(
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(kBorderradius),
                              image: DecorationImage(
                                image: NetworkImage(item),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ))
                      .toList(),
                  options: CarouselOptions(
                    height: 150,
                    enlargeCenterPage: true,
                    reverse: true,
                    enableInfiniteScroll: false,
                    aspectRatio: 1.0,
                    viewportFraction: 0.85,
                  )),
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: Text(
                  'PAST EVENTS',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: kTexttitlesize,
                  ),
                ),
              ),
              CarouselSlider(
                  items: imagelist
                      .map((item) => Container(
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(kBorderradius),
                              image: DecorationImage(
                                image: NetworkImage(item),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ))
                      .toList(),
                  options: CarouselOptions(
                    height: 150,
                    enlargeCenterPage: true,
                    reverse: true,
                    enableInfiniteScroll: false,
                    aspectRatio: 1.0,
                    viewportFraction: 0.85,
                  )),
            ],
          ),
        ),
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