import 'package:flutter/material.dart';
import 'package:uas_mobile/screens/add_bio.dart';
import 'package:uas_mobile/screens/dashboard.dart';
import 'package:uas_mobile/screens/detail_bio.dart';
import 'package:uas_mobile/screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Raleway',
      ),
      initialRoute: '/splash',
      routes: {
        '/': (context) => const Dashboard(),
        '/add-bio': (context) => const AddBioPage(),
        '/splash': (context) => const SplashScreen(),
        '/detail-bio': (context) => DetailBioPage(),
      },
    );
  }
}
