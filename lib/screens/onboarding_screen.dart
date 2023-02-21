import 'package:ahhf_app/screens/home.dart';
import 'package:ahhf_app/screens/login1.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class OnboardingScreen extends StatefulWidget {
  static const String id = '/onboarding_screen';
  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late PageController _pageController;

  double _pageIndex = 0;

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            PageView.builder(
              itemCount: onboard_data.length,
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  _pageIndex = index.toDouble();
                  // _pageIndex++;
                });
              },
              itemBuilder: (context, index) => OnboardSlide(
                title: onboard_data[index].title,
                description: onboard_data[index].description,
                imageLocation: onboard_data[index].imageLocation,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                children: <Widget>[
                  const Spacer(),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromRGBO(241, 200, 76, 1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(42),
                      ),
                    ),
                    child: Container(
                      padding: EdgeInsets.all(19),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'PROCEED',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.black,
                            size: 12,
                          ),
                        ],
                      ),
                    ),
                    onPressed: () {
                      _pageIndex.toInt() == onboard_data.length - 1
                          ? Navigator.pushReplacementNamed(context, Mylogin.id)
                          : _pageController.nextPage(
                              duration: Duration(milliseconds: 300),
                              curve: Curves.ease,
                            );
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  DotsIndicator(
                    dotsCount: onboard_data.length,
                    position: _pageIndex,
                    decorator: DotsDecorator(activeColor: Colors.white),
                  ),
                  const SizedBox(
                    height: 43,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class OnboardDataModel {
  final String imageLocation;
  final String title;
  final String description;
  OnboardDataModel({
    required this.title,
    required this.description,
    required this.imageLocation,
  });
}

final List<OnboardDataModel> onboard_data = [
  OnboardDataModel(
    title: 'Every donation counts',
    description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
    imageLocation: 'assets/images/onboarding1.png',
  ),
  OnboardDataModel(
    title: 'Every donation counts',
    description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
    imageLocation: 'assets/images/onboarding2.png',
  ),
  OnboardDataModel(
    title: 'Every donation counts',
    description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
    imageLocation: 'assets/images/onboarding3.png',
  ),
];

class OnboardSlide extends StatelessWidget {
  final String imageLocation;
  final String title;
  final String description;

  OnboardSlide({
    required this.imageLocation,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(imageLocation),
          fit: BoxFit.fitWidth,
        ),
      ),
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.transparent, Colors.black87],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        padding: EdgeInsets.symmetric(
          horizontal: 30,
        ),
        child: Column(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(58),
              child: Image.asset(
                'assets/images/icon.png',
                height: 54,
              ),
            ),
            const Spacer(),
            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w600,
                decoration: TextDecoration.none,
                fontFamily: 'Montserrat',
              ),
            ),
            const SizedBox(
              height: 14,
            ),
            Text(
              description,
              style: TextStyle(
                color: Colors.white,
                decoration: TextDecoration.none,
                fontFamily: 'Montserrat',
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 165,
            ),
          ],
        ),
      ),
    );
  }
}
