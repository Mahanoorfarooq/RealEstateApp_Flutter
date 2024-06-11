import 'package:flutter/material.dart';
import 'package:real_estate/pages/apartment.dart';
import 'package:real_estate/pages/building.dart';
import 'package:real_estate/pages/explore.dart';
import 'package:real_estate/pages/flat.dart';
import 'package:real_estate/pages/front_page.dart';
import 'package:real_estate/pages/Dashboard.dart';
import 'package:real_estate/pages/gmap.dart';
import 'package:real_estate/pages/housePage.dart';
import 'package:real_estate/pages/login_signup.dart';
import 'package:real_estate/widgets/chat_page.dart';
import 'package:real_estate/widgets/favorite.dart';
import 'theme/color.dart';
import 'package:real_estate/Firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_analytics/firebase_analytics.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Monoline Properties',
      theme: ThemeData(
        primaryColor: AppColor.primary,
      ),
      routes: {
        '/home': (context) => HomePage(),
        '/house': (context) => HousePage(),
        '/explore': (context) => ExplorePage(),
        '/login': (context) => Login(),
        '/signup': (context) => SignUp(),
        '/frontpage': (context) => FrontPage(),
        '/chat': (context) => ChatPage(),
        '/favorite': (context) => Favorite(),
        '/apartment': (context) => ApartmentPage(),
        '/flat': (context) => FlatPage(),
        '/building': (context) => BuildingPage(),
      },
      home: Scaffold(body: FrontPage()),
    );
  }
}

class CoverPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 5), () {
      Navigator.of(context).pushReplacementNamed('/frontpage');
    });
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'assets/images/Logo.png',
              width: 400,
              height: 350,
            ),
          ],
        ),
      ),
    );
  }
}
