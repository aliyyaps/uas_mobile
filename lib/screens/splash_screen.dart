import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToHome();
  }

  _navigateToHome() async {
    await Future.delayed(const Duration(seconds: 5), () {});
    Navigator.pushNamed(context, '/');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: BoxConstraints(
          minHeight: MediaQuery.of(context).size.height,
          minWidth: MediaQuery.of(context).size.width,
        ),
        decoration: const BoxDecoration(
          color: Color(0xff6777ef),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 150,
              child: Image.asset(
                'assets/logo-light.png',
              ),
            ),
            const SizedBox(
              height: 16.0,
            ),
            const Text(
              "BIMA",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 32.0,
                color: Colors.white,
              ),
            ),
            const SizedBox(
              height: 8.0,
            ),
            const Text(
              'Biodata Management Mobile-Apps',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w200,
                fontSize: 16.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
