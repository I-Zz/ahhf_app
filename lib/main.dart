import 'package:ahhf_app/authProvider/login_with_email_screen.dart';
import 'package:ahhf_app/authProvider/login_with_phone.dart';
import 'package:ahhf_app/provider/admin.dart';
import 'package:ahhf_app/provider/userAuth.dart';
import 'package:ahhf_app/screens/admin_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

import './screens/providerUmbrellaScreen.dart';
import './screens/projects_detail_screen_overview.dart';
import './screens/projects_screen.dart';
import './screens/loginSignupScreen.dart';
import './screens/register.dart';
import './screens/homepagetabs.dart';
import './screens/onboarding_screen.dart';
import './screens/tabs_screen.dart';
import './authProvider/google_sign_in.dart';
import './screens/junctionScreen.dart';
import './templates/animation_template.dart';
import './screens/editProfileScreen.dart';
import 'screens/events_admin_portal.dart';
import './provider/admin.dart';
import './screens/feed_admin_portal.dart';
import './provider/feed_admin.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => GoogleSignInProvider()),
          ChangeNotifierProvider(create: (context) => CurrentUser()),
          ChangeNotifierProvider(create: (context) => AdminEvent()),
          ChangeNotifierProvider(create: (context) => AdminFeed()),
          //ChangeNotifierProvider(create: (context) => Project)
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          // initialRoute: Mylogin1.id,
          routes: {
            Splash.id: (context) => Splash(),
            ProviderUmbrellaScreen.id: (context) => ProviderUmbrellaScreen(),
            JunctionScreen.id: (context) => JunctionScreen(),
            OnboardingScreen.id: (context) => OnboardingScreen(),
            Mylogin.id: (context) => Mylogin(),
            Myregister.id: (context) => Myregister(),
            HomePageTabsScreen.id: (context) => HomePageTabsScreen(),
            TabsScreen.id: (context) => TabsScreen(),
            ProjectScreen.id: (context) => ProjectScreen(),
            // ProjectsDetailScreen.id: (context) => ProjectsDetailScreen(),
            LoginWithEmail.id: (context) => LoginWithEmail(),
            PhoneAuthentication.id: (context) => PhoneAuthentication(),
            LogoAnimationScreen.id: (context) => LogoAnimationScreen(),
            AdminPortalScreen.id: (context) => AdminPortalScreen(),
            // EditProfileScreen.id: (context) => EditProfileScreen(),
          },
          // home: Splash(),
          initialRoute: Splash.id,
          //initialRoute: LogoAnimationScreen.id,
        ),
      );
}

class Splash extends StatefulWidget {
  static const String id = '/splash_screen';
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true);
    _animation =
        CurvedAnimation(parent: _controller, curve: Curves.easeOutSine);

    Future.delayed(Duration(seconds: 3), () {
      // Navigator.pushReplacement(
      //     context, MaterialPageRoute(builder: (context) => Mylogin()));

      // Navigator.pushReplacementNamed(context, OnboardingScreen.id);

      Navigator.pushReplacementNamed(context, ProviderUmbrellaScreen.id);
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/splash_img.png"),
          fit: BoxFit.cover,
        ),
      ),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Container(
        decoration: BoxDecoration(color: Color.fromRGBO(0, 0, 0, 0.72)),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: FadeTransition(
          opacity: _animation,
          child: Image.asset(
            'assets/images/full_logo.png',
            filterQuality: FilterQuality.high,
          ),
        ),
      ),
    );
  }
}
